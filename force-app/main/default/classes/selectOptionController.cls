public class selectOptionController {
    public string s {get;set;}
    public list<Sobject> lstOfRec {get;set;}
    public selectOptionController(){
        s = 'Account';
        accountRec();
    }
    public List<Sobject> accountRec(){
        lstOfRec =  [SELECT ID, Name FROM Account LIMIT 10];
        System.debug('accountRec=======>'+lstOfRec);
        return lstOfRec;
    }
    public List<Sobject> ContactRec(){
        lstOfRec.clear();
        lstOfRec =  [SELECT ID, Name FROM Contact LIMIT 10];
        System.debug('ContactRec=======>'+lstOfRec);
        return lstOfRec;
    }
    public List<Sobject> leadRec(){
        lstOfRec.clear();
        lstOfRec =  [SELECT ID, Name FROM Lead LIMIT 10];
        System.debug('leadRec=======>'+lstOfRec);
        return lstOfRec;
    }
    
}