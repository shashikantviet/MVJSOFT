public class AccAndConHandler {
    public void AccAndConHandler(){
        
    }
    public void onAfterInsert(List<Account> acc){
        List<Contact> cnt = new List<Contact>();
        for(Account a : acc){
            Contact ct = new Contact(AccountId = a.Id,
                                     LastName = 'yadav');
            cnt.add(ct);
        }
        insert cnt;
    }
    public void onAfterDelete(List<Account> acc){
        
    }
}