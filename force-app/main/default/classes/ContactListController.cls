public class ContactListController {
    @auraEnabled
    public static List<Contact> findAll(){
        List<Contact> lstCon = [SELECT ID, Name, Phone FROM Contact LIMIT 10];
        System.debug('findAlllstCon==>'+lstCon);
        return lstCon;
    }
    
    @auraEnabled
    public static List<Contact> findByName(String searchKey){
        List<Contact> lstCon = new List<Contact>();
        String query = 'SELECT Id, Name, Phone FROM Contact WHERE Name Like \'%'+searchKey+'%\'';
        lstCon = Database.query(query);
        System.debug('findByNamelstCon==>'+lstCon);
        return lstCon;
    }
    
    @auraEnabled
    public static List<Contact> findById(String contactId){
        List<Contact> lstCon = new List<Contact>();
        String query ='SELECT Id, Name, Phone, Mobilephone, Account.Name FROM Contact WHERE Phone Like \'%'+contactId+'%\'';
        lstCon = Database.query(query);
        System.debug('findByIdlstCon==>'+lstCon);
        return lstCon;
    }

}