public class AccountHandler {
    public Static void AccountHandler(){
        
    }
    public void onBeforeInsert(List<Account> acc){
        List<Account> lstUpdateToShippingAdd = new List<Account>();
        for(Account a : acc){
            if(a.Match_Billing_Address__c == True){
                System.debug('a'+a);
                Account act = new Account( Id = a.Id,
                                          BillingStreet = a.ShippingStreet,
                                          BillingCity = a.ShippingCity,   
                                          BillingState = a.ShippingState,
                                          BillingPostalCode = a.ShippingPostalCode,
                                          BillingCountry = a.ShippingCountry);
                lstUpdateToShippingAdd.add(act);
            }
        }
        if(!lstUpdateToShippingAdd.isEmpty()){
            update  lstUpdateToShippingAdd;
        }
    }
}