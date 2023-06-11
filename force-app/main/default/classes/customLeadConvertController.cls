public class customLeadConvertController {
    
    @AuraEnabled
    public static Lead getCurrentRecorddetails(String recordId){
        Lead objLead = [SELECT Id,Name,Company,Street, City, State, Country, PostalCode from Lead Where Id =: recordId];
        return objLead;
    }
    
    @AuraEnabled
    public static List <SObject> fetchLookUpValues(String searchKeyWord, String ObjectName, String SelectedAccId) {
        
        String searchKey = searchKeyWord + '%';
        String query = 'select id, Name';
        if(ObjectName == 'Contact'){
            query = query + ', MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry';
        }
        if(ObjectName == 'Lead'){
            query = query + ', Street, City, State, Country, PostalCode';
        }
        query = query +' from ' + ObjectName + ' where Name LIKE \'' +searchKey+ '\'';
        if(!String.isEmpty(SelectedAccId)){
            query = query + 'AND Account.Id =: SelectedAccId ';    
        } 
        
        query = query + 'order by createdDate DESC limit 5';
        List <SObject> returnList = database.query(query);
        return returnList;
    }
    
    @AuraEnabled
    public static void SaveDatas(String allValues, boolean checkToggle, String AccId){
        System.debug('checkToggle>>>>>>>>'+checkToggle);
        System.debug('>AccId>>>>>>'+AccId);
        List<String> lstOfVal = allValues.split(', ');
        String oppName = lstOfVal[0];
        String AccName = lstOfVal[1];
        String ContName = lstOfVal[2];
        String street = lstOfVal[3];
        String City = lstOfVal[4];
        String State = lstOfVal[5];
        String Country = lstOfVal[6];
        String PostalCode = lstOfVal[7];
        
        /*if(checkToggle == false){
            Contact cont = new Contact(FirstName = ContName, MailingStreet = street, MailingCity = City, MailingState = State, MailingCountry = Country, MailingPostalCode = PostalCode);
            insert cont;
        }else{
            
        }
       if(!String.isEmpty(oppName) || oppName != 'undefined'){
        Opportunity opp =  new Opportunity(Name = oppName);
        insert opp;
        }
        
        Account acc =  new Account(Name = AccName);
        insert acc;{
        
        }
        Contact cont = new Contact(FirstName = ContName, MailingStreet = street, MailingCity = City, MailingState = State, MailingCountry = Country, MailingPostalCode = PostalCode);
        insert cont; */
    }
    
}