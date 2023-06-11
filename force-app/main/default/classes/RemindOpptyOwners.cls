global class RemindOpptyOwners implements Schedulable{
    global void execute(SchedulableContext cntxt){
        List<Opportunity> oppList = [SELECT ID, Name, OwnerId, CloseDate FROM Opportunity WHERE 
                                     IsClosed= FALSE AND CloseDate<Today];
        RemindOpportunityOwners.createTaskforOpp(oppList);
    }

}