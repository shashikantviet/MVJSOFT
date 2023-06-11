trigger updateOpp on Task (After insert) {
    if((Trigger.isAfter) && (Trigger.isInsert)){
        OppTriggerHandler.updateOpportunity(Trigger.new);
    }

}