public class ContactController {
@AuraEnabled
    public static List<Contact> getcontacts(){
        List<Contact> lstCon =[SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact WHERE MailingStreet != NULL AND Email != NUll];
        return lstCon;
    }
}