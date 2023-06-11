trigger PopulateLeadId on Lead (After insert, After update) {
    if(PopulateLeadIdHandler.isUpdate){
         PopulateLeadIdHandler.isUpdate = false;
        PopulateLeadIdHandler.updateCaseId(Trigger.new);
    }
    
}