/**
* Class Name: ContactTriggerHan
* Description: Called due to updateAdrsOfSelAccount method
*/
public class ContactTriggerHan {
    //Constructor
    public ContactTriggerHan(){
        
    }
    
    
    /*
* Name 		  : updateAdrsOfSelAccount
* Params 	  : lstOfAccToUpdate
* Description : Calling this method on contact's before insert to udpate the parent account's BillingAddress from the current Contact's MailingAddress..
*/
    public void updateAdrsOfSelAccount(List<Contact> lstCon){
        List<Account> lstOfAccToUpdate =  new List<Account>();
        for(Contact conObj : lstCon){
            Account objAcc = new Account(Id = conObj.AccountId,
                                         BillingStreet = conObj.MailingStreet,
                                         BillingCity = conObj.MailingCity,   
                                         BillingState = conObj.MailingState,
                                         BillingPostalCode = conObj.MailingPostalCode,
                                         BillingCountry = conObj.MailingCountry
                                        );
            lstOfAccToUpdate.add(objAcc);
        }
        if(!lstOfAccToUpdate.isEmpty()){
            update lstOfAccToUpdate;
        }
    }
}