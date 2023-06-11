global class Scheduler_class implements Schedulable{
    global void execute (SchedulableContext SC){
       UpdateStatusOfProject updateStatus = new  UpdateStatusOfProject ();
       database.executeBatch(updateStatus);
    }
}