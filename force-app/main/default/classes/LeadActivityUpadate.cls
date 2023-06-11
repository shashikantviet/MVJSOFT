/**
 * 	Batch name			:	LeadActivityUpadate
 *  Created by			:   Shashikant
 *  Created on			:	08-May, 2018
 *  Last Modified by    :	None
 *  Last Modified on	:   None
 *  Description			:	Batch apex to populate the minimum activity date in the lead.Next_Activity_Date__c field
 */ 
global class LeadActivityUpadate implements Database.Batchable<Sobject> {
  
    global Database.QueryLocator start(Database.BatchableContext BC) { 
        
        return Database.getQueryLocator('SELECT Id, Next_Activity_Date__c FROM Lead');
    }
    
    global void execute(Database.BatchableContext BC, List<Lead> lstOfLeadsInContext) {     
        
        Set<Id> setOfLeadIdsInContext = new Set<Id>();
        List<Lead> lstOfLeadsToUpdate = new List<Lead>();
        Map<Id, Date> mapOfLeadIdAndTaskMinDueDate = new Map<Id, Date>();
        
        for(Lead objLead : lstOfLeadsInContext) {
            
            setOfLeadIdsInContext.add(objLead.Id);
        }
                
        for(Task objTask : [SELECT Id, ActivityDate, WhoId FROM Task 
                            WHERE WhoId IN :setOfLeadIdsInContext 
                            AND Status != 'Completed' 
                            ORDER BY ActivityDate DESC]) {
        	
            mapOfLeadIdAndTaskMinDueDate.put(objTask.WhoId, objTask.ActivityDate);
        }
        
        for(Id strLeadRecordId : setOfLeadIdsInContext) {
            
            if(mapOfLeadIdAndTaskMinDueDate.containsKey(strLeadRecordId)) {
                
                lstOfLeadsToUpdate.add(new Lead(Id = strLeadRecordId, Next_Activity_Date__c = mapOfLeadIdAndTaskMinDueDate.get(strLeadRecordId) != null ? mapOfLeadIdAndTaskMinDueDate.get(strLeadRecordId) : date.today()));
            }
        }
        
        if(!lstOfLeadsToUpdate.isEmpty()) {
            
            update lstOfLeadsToUpdate;
        }       
    }
    
    global void finish(Database.BatchableContext BC) {
    
    }
}