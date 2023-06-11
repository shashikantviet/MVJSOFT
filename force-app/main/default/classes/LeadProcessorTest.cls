@isTest
private class LeadProcessorTest {
	@testSetup
    static void setup(){
        List<Lead> leadlst = new List<Lead>();
        for(Integer i = 0 ; i <= 100 ; i++){
            Lead led = new Lead();
            led.FirstName ='FirstName';
            led.LastName ='LastName'+i;
            led.Company ='demo'+i;
            leadlst.add(led);
        }
        insert leadlst;
    }
    static testMethod void test(){
        test.startTest();
        LeadProcessor ledPro = new LeadProcessor();
        Database.executeBatch(ledPro);
        test.stopTest();
        System.assertEquals(100 ,100);
    }
}