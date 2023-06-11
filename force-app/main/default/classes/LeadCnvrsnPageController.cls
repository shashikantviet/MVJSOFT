public class LeadCnvrsnPageController {
    public String currentRecordName {get;set;}
    public String ownerName {get;set;}
    public String taskSubject {get;set;}
    public String taskStatus {get;set;}
    public Date taskDueDate {get;set;}
    public String taskPriority {get;set;}
    public Lead leadObj {get;set;} 
    public LeadCnvrsnPageController(){
        taskSubject = '';
        taskStatus = '';
        taskDueDate = Date.today();
        taskPriority = '';
        String currentRecordId = ApexPages.CurrentPage().getparameters().get('id');
        recDetail(currentRecordId);
    }
    public void recDetail(String recId){
        leadObj =  [SELECT Id, FirstName, LastName, Owner.Name, Company, Status  FROM Lead Where Id =: recId];
        currentRecordName = leadObj.FirstName + ' ' + leadObj.LastName;
    }
    
    public void createAccConOppo(){
        System.debug('taskSubject==>'+taskSubject);
        System.debug('taskStatus==>'+taskStatus);
        System.debug('taskDueDate==>'+taskDueDate);
        System.debug('taskPriority==>'+taskPriority);
    }
}