public class testLightCompCon {
    
    public class wrapAccountAndContact{
        @AuraEnabled
        public String conName;
        @AuraEnabled
        public String accName;
        wrapAccountAndContact(String conName, String accName){
            this.conName = conName;
            this.accName = accName;
            
        }
    }
    
    public class wrapAccountRelatedContacts{
        @AuraEnabled
        public String accName;
        @AuraEnabled
        public List<String> conNames;
        wrapAccountRelatedContacts(String accName, List<String> conNames){
            this.accName = accName;
            this.conNames = conNames;
        }
    }
    
    @AuraEnabled
    public static List<wrapAccountAndContact> fetchAccountRelatedContacts(){
        List<wrapAccountAndContact> lstOfAccountRelatedCon =  new List<wrapAccountAndContact>();
        for(Contact con : [SELECT ID, Name, Account.Name FROM Contact]){
            lstOfAccountRelatedCon.add(new wrapAccountAndContact(con.Name, con.Account.Name));
        }
        System.debug('>>>>>>>>>>>'+lstOfAccountRelatedCon);
        
        
        List<wrapAccountRelatedContacts> lstOfAccountRealtedContacts =  new List<wrapAccountRelatedContacts>();
        Map<Id, Contact> mapOfAccountIdAndRealtedCon =  new Map<Id,Contact>();
        for(Contact con : [SELECT Id, Name, AccountId, Account.Name FROM Contact]){
            mapOfAccountIdAndRealtedCon.put(con.AccountId, con);
        }
        for(Id recId : mapOfAccountIdAndRealtedCon.keyset()){
            System.debug('>>>>>>>'+mapOfAccountIdAndRealtedCon.get(recId));
        }
        for(Account acc : [SELECT Id, Name FROM Account]){
            if(mapOfAccountIdAndRealtedCon.containsKey(acc.Id)){
                System.debug('>>>>mapOfAccountIdAndRealtedCon>>>>>>'+mapOfAccountIdAndRealtedCon.get(acc.Id));
            }
        }
        return lstOfAccountRelatedCon;
    }
}