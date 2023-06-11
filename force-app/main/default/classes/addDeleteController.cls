public class addDeleteController {
    @AuraEnabled
    public static void saveContacts(List<Contact> ListContact){
        System.debug('>>>>>>>>>>>>>>>>>'+ListContact);
        Insert ListContact;
    }
}