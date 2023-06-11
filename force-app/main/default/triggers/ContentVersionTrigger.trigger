trigger ContentVersionTrigger on ContentVersion (after insert) {
    ContentVersionHelper.removeOldContentVersionfromContentDocument(Trigger.new);
}