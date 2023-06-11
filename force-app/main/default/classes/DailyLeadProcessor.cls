global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext con){
        List<Lead> lstLead = [SELECT ID, LeadSource FROM Lead where LeadSource = null LIMIT 200];
        List<Lead> updateLeadLst = new List<Lead>();
        for(Lead objLead : lstLead){
            if(objLead.LeadSource == null){
                objLead.LeadSource = 'DreamForce';
            }
            updateLeadLst.add(objLead);
        }
        update updateLeadLst;
    }
    
}