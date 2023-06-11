public class ContactHandler {
    public ContactHandler(){
        
    }
    
    
    public void onAfterInsert(List<Contact> lstCon){
        List<Account> listAcc = new List<Account>();
        Map<Id, String> mapOfAccountId =  new Map<Id, String>();
        Set<Id> lstOfIds = new Set<Id>();
        for(Contact con : lstCon){
            lstOfIds.add(con.AccountId);
        }
        for(Id ids : lstOfIds){
            String str = '';
            Integer i = 0;
            List<Contact> lstContact = [SELECT ID, LastName FROM Contact WHERE AccountId =: ids];
            for(Contact con : lstContact){
                if(i == 0){
                   str = con.LastName;
                }else{
                    str += ', '+ con.LastName;
                }
                i++;
            }
            mapOfAccountId.put(ids, str);
        }
        System.debug('>>>>>>>>>mapOfAccountId>>>>'+mapOfAccountId);
        for(String accid : mapOfAccountId.keySet()){
            listAcc.add(new Account(Id = accid, LastNameOfContacts__c= mapOfAccountId.get(accid)));
        }
        System.debug('>>>>>>>>>listAcc>>>>'+listAcc);
        if(!listAcc.isEmpty()){
            Database.update(listAcc,false);
        } 
	}
}