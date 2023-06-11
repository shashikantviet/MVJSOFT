public class DocumentManagementCtrl {
      
    @AuraEnabled(Cacheable=true)
    public static List <Document__c> fetchDocuments(String field, String sortOrder) {
        String query;
        query  = 'SELECT Id, Name, Document_Version__c, Document_Category__c FROM Document__c';
        if(field != null && sortOrder !=null){
            query += ' ORDER BY '+field+' '+sortOrder;
        }
        return Database.query(query);
    }
    
    @AuraEnabled
    public static string updateDocument( Object data ) {
        
        List < Document__c > accsForUpdate = ( List < Document__c > ) JSON.deserialize(
            JSON.serialize( data ),
            List < Document__c >.class
        );
        try {
            update accsForUpdate;
            return 'Success: Account(s) updated successfully';
        }
        catch (Exception e) {
            return 'The following exception has occurred: ' + e.getMessage();
        }
        
    }
    
}