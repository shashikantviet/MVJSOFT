public class ContactLightningCardController {
        
    @AuraEnabled
    public static List<Contact> getLstOfContacts(){
        return [SELECT Id, Name, Account.Name FROM Contact LIMIT 10];
    }

}