public class ShowAccountNameCon {
    public List<Account> lstAcc {get;set;}
    public ShowAccountNameCon(){
        lstAcc = [SELECT ID, Name FROM Account];
    }
}