public class AccountRecController {
    public List<Account> lstAcc {get;set;}
    
    public AccountRecController(){
        lstAcc = [SELECT Id, Name, Site, Owner.Name, Type  FROM Account ORDER BY LastViewedDate LIMIT 10];
    }
}