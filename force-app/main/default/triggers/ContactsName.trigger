trigger ContactsName on Contact (after insert, after update) {
    ContactHandler con =  new ContactHandler();
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            con.onAfterInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
           con.onAfterInsert(Trigger.new); 
        }
    }
}