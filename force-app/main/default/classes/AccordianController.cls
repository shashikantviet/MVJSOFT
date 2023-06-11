public class AccordianController {
    public List<Sobject> lstOfRec{get;set;}
    
    public AccordianController(){
        lstOfRec = [SELECT ID,Title, Text__c FROM Knowledge__kav WHERE ArticleParentId__c ='ka07F000000MkggQAC' ORDER BY ArticleOrderNumber__c];
        
    }

}