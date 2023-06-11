public class SMSUtils {
    public static void someFutureMethod(List<Id> recId){
        List<Account> lstAccount = [SELECT Id, Name, Description FROM Account WHERE Id IN : recId];
    }
}