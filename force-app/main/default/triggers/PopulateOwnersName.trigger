trigger PopulateOwnersName on Owner__c (after insert,after update) {
	OwnerTriggerHandler handler = new OwnerTriggerHandler();
    
    if(Trigger.isAfter && Trigger.isInsert)
        handler.onAfterInsert(Trigger.new);
    if(Trigger.isAfter && Trigger.isUpdate)
        handler.onAfterUpdate(Trigger.old);
}