global class LeadProcessor implements
Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Name,LeadSource, Industry FROM lead');
    }
    global void execute(Database.BatchableContext bc,List<Lead> leadRec){
        List<Lead> leadLst = new List<Lead>();
        for(Lead lObj : leadRec){
            if(lObj.LeadSource == null){
                lObj.LeadSource = 'Dreamforce';
                leadLst.add(lObj);
            }
        }
        System.debug('=======leadLst>>>>>' +leadLst);
        update leadLst;
    }
    global void finish(Database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
                            JobItemsProcessed,
                            TotalJobItems, CreatedBy.Email 
                            FROM AsyncApexJob
                            WHERE Id = :bc.getJobId()];
        System.debug('=========job>>>>>' +job);
    }
    
}