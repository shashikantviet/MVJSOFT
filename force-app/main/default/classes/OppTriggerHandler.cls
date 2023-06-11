public class OppTriggerHandler {
    public void OppTriggerHandler(){
        
    }
    public Static void updateOpportunity(List<Task> lstOfTask) {
        Set<Id> ContactIdSet =  new Set<ID>();
        Map<ID, List<Opportunity>> OppRelatedToCon =  new Map<Id, List<Opportunity>>();
        for(Task tsk : lstOfTask){
            Task currentTask = [SELECT ID, Who.Name, Who.ID, Who.Type FROM Task WHERE ID =:tsk.ID];
            if(currentTask.Who.Type == 'Contact'){
                ContactIdSet.add(currentTask.Who.Id);
            }
        }
        List<Contact> lstCon = [SELECT ID, Name, (SELECT ID, Name FROM Opportunities) FROM Contact WHERE ID =: ContactIdSet];
        for(Contact objCon : lstCon){
            OppRelatedToCon.put(objCon.Id, objCon.Opportunities);
        }
    }
    
}