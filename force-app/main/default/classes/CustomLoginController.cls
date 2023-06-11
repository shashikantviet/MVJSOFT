/*
* @ClassName    : CustomLoginController
* @CreatedOn    : 26/12/2018
* @CreatedBy    : Shashi Yadav
* @Description  : 
*/
public class CustomLoginController {
    Public String UserName {get;set;}
    Public String LoginPass {get;set;}
    
    public CustomLoginController(){
        UserName ='';
        LoginPass ='';
    }
    
    public void checkLoginCredentials(){
        System.debug('>>>>UserName>>>>'+UserName);
        System.debug('>>>>LoginPass>>>>'+LoginPass);
        if((UserName!= null||UserName!='')&&(LoginPass!=null || LoginPass!= null)){
            if(UserName.contains('@')){
                List<LoginCredential__c> lstOfcurrentLogin = [SELECT Id, Name, UserPassword_del__c FROM LoginCredential__c WHERE UserPassword_del__c =: LoginPass];
                System.debug('>>>>lstOfcurrentLogin>>>>'+lstOfcurrentLogin);
            }
        }
        UserName = '';
        LoginPass ='';
    }
    public void resetButton(){
        UserName ='';
        LoginPass ='';
    }

}