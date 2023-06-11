public class AG_Grid_Controller {
    Public String lstAcc{get;set;}
	
    public AG_Grid_Controller(){
		lstAcc = JSON.serialize([SELECT ID, Name, Phone FROM Account]) ;       
    }
    
    @AuraEnabled
    public static String getAccountRecord(){
        return JSON.serialize([SELECT ID, Name, Phone FROM Account]); 
    }
}