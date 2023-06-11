public class AccountDetail {
    public List<Account> lstAccount{get;set;}
    public AccountDetail(){
        accountLst();
    }
    
    public List<Account> accountLst(){
        lstAccount= new List<Account>();
        String query ='select Id, Name from Account';
            lstAccount = database.query(query);
        return lstAccount;
    }
}