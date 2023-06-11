public class AccountDeletion {
   public List<Account> lstAcc {get;set;}
    
    public AccountDeletion(){
        lstAcc =  new List<Account>();
        totalAccount();
    }
    
    public List<Account> totalAccount(){
        lstAcc = [SELECT ID, Name FROM Account];
        return lstAcc;
    }
    public static void deleteSelRec(Id recID){
        Account acc = [SELECT Id FROM Account where Id = :recId];
        delete acc;
        
    }

}