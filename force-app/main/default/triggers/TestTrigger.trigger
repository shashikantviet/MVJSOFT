trigger TestTrigger on Contact (before insert) {
    TriggerHandlerOnAccount tHOA =  new TriggerHandlerOnAccount();
    if(Trigger.isbefore){
        if(Trigger.isInsert){
            tHOA.insertContact(Trigger.new);
        }
    }
}