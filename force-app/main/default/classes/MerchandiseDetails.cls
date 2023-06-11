public class MerchandiseDetails {
    public String linkToRec {get;set;}
    public String merName {get;set;}
    public String merLastName {get;set;}
    public Decimal merAge {get;set;}
    public List<Merchandise__c> lstOfRec {get;set;}
    
    public MerchandiseDetails(){
        linkToRec = System.Url.getSalesforceBaseUrl().toExternalForm() + '/a057F00000DPHEK';
        
    }
    
    public void saveNewRec(){
        Merchandise__c merObj = new Merchandise__c();
        merObj.Name = merName;
        merObj.LastName__c = merLastName;
        merObj.Age__c = merAge;
        insert merObj;
        
    }

}