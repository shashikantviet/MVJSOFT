trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    list<task> createTask = new list<task>();
    for(Opportunity lstRec : Trigger.new){
        if(Trigger.isInsert){
            if(lstRec.StageName == 'Closed Won'){
                task t = new task();
                t.Subject = 'Follow Up Test Task';
                t.WhatId = lstRec .Id;
                createTask.add(t);
            }
        }
    }
    if(createTask.size() > 0)
        insert createTask;
}