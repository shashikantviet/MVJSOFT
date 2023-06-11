public class newTestController {
    public Map<ID, Contact> cMap {get;set;}
    public Contact editableRecord {get;set;}
    
    // Using lazy load for test purposes
    public List<Contact> cList {
        get{
            if(cMap == null){
                cMap = new Map<ID, Contact>([SELECT Id, FirstName, LastName From Contact limit 10]);
            }
            return cMap.values();
        }
    }
    
    public newTestController(){ }
    
    public PageReference reloadContacts(){
        if(cMap!=null && !cMap.isEmpty()){
            Set<Id> myIds = cMap.keySet();
            // reload same records loaded at the start
            cMap = new Map<ID, Contact>([SELECT Id, FirstName, LastName From Contact WHERE Id IN :myIds]); 
        }
        return null;
    }
    
    public PageReference editSelectedRecord() {
        String cID = ApexPages.currentPage().getParameters().get('cid');
        if(cMap!=null && !cMap.isEmpty() && cMap.containsKey(cID)){
            editableRecord = cMap.get(cID);
        }
        return null;
    }
    
    public PageReference saveRecord(){
        update editableRecord;
        editableRecord = null; // so we don't save two times same record
        return reloadContacts(); //instantly update current list do not wait for poller
    }
    
}