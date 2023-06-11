public class BulkTriggerHandler {
    public void BulkTriggerHandler(){
        //Constructor.
    }
    public void onBeforeInsert(List<Account> acc){
        for(Account a : acc){
            a.description = 'New Description';
        }
        
    }
}