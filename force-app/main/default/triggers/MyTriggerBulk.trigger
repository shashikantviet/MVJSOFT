trigger MyTriggerBulk on Account(before insert,after update) {
    BulkTriggerHandler handler = new BulkTriggerHandler();
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            handler.onBeforeInsert(Trigger.new);
        }
    }
}