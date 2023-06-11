public class AccordionAuraController {
    @AuraEnabled
    public static List<Account> getAccount(){
        List<Account> AccList = new List<Account>();
        for(Account accObj : [SELECT Id, Name, Phone, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry From Account LIMIT 5]){
            AccList.add(accObj); 
        }
        return AccList;
    }
}