global class UpdateStatusOfProject implements Database.Batchable<SObject>, Database.Stateful{
    
    public List<Project__c> listRecords = new List<Project__c>();
    public string query;
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        Date todayDate = System.today();
        String query = 'Select Name, Id, CloseDates__c, Status__c From Project__c where CloseDates__c <=: todayDate AND Status__c  = TRUE';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Project__c > scope){
        System.debug('scope==>' +scope);
        for(Project__c obj :  scope){
            obj.Status__c = false;
            listRecords.add(obj);
        }
        update listRecords;  
    }
    
    global void finish(Database.BatchableContext bc)
    {
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();            
        mail.setToAddresses(new LIst<String>{'shashikantviet@gmail.com'});
        mail.setSubject('Making Projects as Inactive');
        String strBody = '<p> Below are the Projects got completed </p> <br/> <ul> ';
        for(Project__c obj :  listRecords){
            strBody += '<li>' +obj.Name + '</li>';   
        }
        strBody  += '</ul>';
        mail.setHtmlBody(strBody);
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {mail};
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
    }
}