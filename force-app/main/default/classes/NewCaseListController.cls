public class NewCaseListController {
    public List<Case> NewCases{get;set;}
    public Integer check {get;set;}
    
    //Construtor of Class.
    public NewCaseListController(){
        newCaseLst();
        check = 0;
    }
    
    public void newCaseLst(){
        check = 0;
        NewCases = new List<Case>([SELECT ID, CaseNumber FROM Case where status = 'New']);
        
    }
    public void newCaseLst2(){
        check = 1;
        NewCases = new List<Case>([SELECT ID, CaseNumber FROM Case where status = 'New']);
        
    }
}