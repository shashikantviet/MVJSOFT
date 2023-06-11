trigger CountNoOfContactTorelatedAcc on Contact (after insert, after delete, after update) {
    if(Trigger.isInsert && Trigger.isAfter){
        CountNoOfContactTorelatedAccHandler.CountNoOfContactTorelatedOnInsert(Trigger.new);
    }
    if(Trigger.isInsert && Trigger.isAfter){
        
    }
    if(Trigger.isInsert && Trigger.isAfter){
        
    }
}