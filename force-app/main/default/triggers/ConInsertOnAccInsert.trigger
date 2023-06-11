trigger ConInsertOnAccInsert on Account (after insert, after delete) {
	AccAndConHandler acctHandler = new AccAndConHandler();
    if((Trigger.isAfter) && (Trigger.isInsert)){
        acctHandler.onAfterInsert(Trigger.new);
    }
    if((Trigger.isAfter) && (Trigger.isDelete)){
        acctHandler.onAfterDelete(Trigger.old);
    }
}