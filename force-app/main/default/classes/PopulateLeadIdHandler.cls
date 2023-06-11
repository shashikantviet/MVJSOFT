public class PopulateLeadIdHandler {
    public static Boolean isUpdate = true;
    
    public static void updateCaseId(List<Lead> lstLead){
        
        Set<ID> setOfLeadIds =  new Set<ID>();
        List<Lead> lstOfLeadToUpdate =  new List<Lead>();
        for(Lead led : lstLead){            
            setOfLeadIds.add(Led.Id);
        }
        
        for(Lead led : [SELECT ID, Lead_ID__c FROM Lead WHERE ID IN : setOfLeadIds]){
            
            lstOfLeadToUpdate.add(new Lead(Id = led.Id, Lead_ID__c = led.Id));
        }
        
        if(!lstOfLeadToUpdate.isEmpty()){
            
            update lstOfLeadToUpdate;
        }
        
        
    }
    
}