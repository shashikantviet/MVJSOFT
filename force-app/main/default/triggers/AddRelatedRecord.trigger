trigger AddRelatedRecord on Account (after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    List<Account> acctsWithOpps = [SELECT Id, Name FROM Account WHERE Id IN :Trigger.New AND
                                   Id NOT IN (SELECT AccountId FROM Opportunity)];
    for (Account a : acctsWithOpps) {
        oppList.add(new Opportunity(AccountId=a.Id,
                                    Name=a.Name + ' Opportunity',
                                    StageName='Prospecting',
                                    CloseDate=System.today().addMonths(1)
                                   )); 
    }
    
    if (oppList.size() > 0) {
        insert oppList;
    }
}