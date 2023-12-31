public with sharing class LeadController {

    @AuraEnabled
    public static List<Lead> getLeadRecord() {
        return [SELECT id, name, phone,status,Owner.name FROM Lead LIMIT 50];
    }
     @AuraEnabled
    public static List<Lead> massUpdateLeads(String recIds,String Status) {
        Object[] values = (Object[])System.JSON.deserializeUntyped(recIds);
        List<String> recvalues = new List<String>();
        for (Object obj : values) {
            recvalues.add(obj != null ? String.valueOf(obj) : null);
        }
        List<Lead> leadlist = new List<Lead> ();
        for(Lead l : [SELECT Id,Status,Owner.name from Lead where id IN:recvalues]){
            l.status = Status;
            leadlist.add(l);   
        }
        update leadlist;
        return [SELECT id, name, phone,Owner.name,status FROM Lead LIMIT 50];
    }
     @AuraEnabled
    public static List<Lead> massUpdateOwner(String recIds) {
        Object[] values = (Object[])System.JSON.deserializeUntyped(recIds);
        List<String> recvalues = new List<String>();
        for (Object obj : values) {
            recvalues.add(obj != null ? String.valueOf(obj) : null);
        }
        List<Lead> leadlist = new List<Lead> ();
        for(Lead l : [SELECT Id,Status,Owner.name from Lead where id IN:recvalues]){
            l.OwnerId = userinfo.getUserId();
            leadlist.add(l);   
        }
        update leadlist;
        return [SELECT id, name, phone,Owner.name,status FROM Lead LIMIT 50];
    }
    @AuraEnabled
    public static List<Lead> getLeadByName(String recName) {
        String name = '%' + recName + '%';
        return [SELECT id, name, phone,Status,Owner.name FROM Lead WHERE name LIKE :name LIMIT 50];
    }
}