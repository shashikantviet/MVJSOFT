@RestResource(urlMapping='/testRestAPIWithSite/*')
global class TestRestAPI {
    @HttpGet
    global static List<Account> doPost(){
        
        List<Account> lstAcc = [SELECT ID, Name FROM Account];
        return lstAcc;
    }

}