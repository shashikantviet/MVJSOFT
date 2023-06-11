public class CountNoOfContactTorelatedAccHandler {
    
    public static void CountNoOfContactTorelatedOnInsert(List<Contact> lstCon){
        Map<Id, Integer> mapOfAccountIdWithTotalContactCounts = new Map<Id, Integer>();
        Map<Id, Id> mapOfContactIdwithAccountId = new Map<Id, Id>();
        Set<Id> setOfAccountIds =  new Set<Id>();
        
        for(Contact con: lstCon){
            mapOfContactIdwithAccountId.Put(con.Id, con.AccountId);
        }
        
        
        
        for(Account acc : [SELECT ID, No_of_Related_Contact__c FROM Account WHERE ID IN : setOfAccountIds]){
            
        }
    }

}