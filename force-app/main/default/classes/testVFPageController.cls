public with sharing class testVFPageController {
    public List<Account> lstAccount {get;set;}
    public testVFPageController(){
        lstAccount = [SELECT ID, Name, Phone FROM Account];
        
    }
   
}