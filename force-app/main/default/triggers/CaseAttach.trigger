trigger CaseAttach on Attachment (after insert, after delete) {
    //object of AttachmentTriggerHandler Class    
    
    AttachmentTriggerHandler handler = new AttachmentTriggerHandler();
    //created a map for matching each parentId
    if((Trigger.isAfter) && Trigger.isInsert){
        handler.countTotalNumberOfAttachment(Trigger.New);
    }
    if((Trigger.isAfter) && (Trigger.isDelete)){
        handler.countTotalNumberOfAttachment(Trigger.Old);
    }
}