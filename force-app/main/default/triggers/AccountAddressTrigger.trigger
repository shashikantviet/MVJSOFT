trigger AccountAddressTrigger on Account (after insert) {
    AccountHandler objAccHandler = new AccountHandler();
    if((Trigger.isAfter) && (Trigger.isInsert)){
        objAccHandler.onBeforeInsert(Trigger.new);
    }
    
}