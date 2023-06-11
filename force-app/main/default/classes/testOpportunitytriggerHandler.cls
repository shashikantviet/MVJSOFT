@IsTest
public class testOpportunitytriggerHandler {
    public static testMethod void testAccountOpportunityType(){
        Account acc = new Account(Name='test001', Custom_Type__c='New Customer');
        Insert acc;
        Opportunity opp = new Opportunity(Name='test001',
                                          AccountId = acc.Id, 
                                          Type='New Customer',
                                          StageName = 'Closed Won', 
                                          CloseDate = date.today());
        Insert opp;
    }

}