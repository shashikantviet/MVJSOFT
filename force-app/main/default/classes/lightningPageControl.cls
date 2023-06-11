public class lightningPageControl {
	@AuraEnabled
    public static List<Opportunity> oppRecords(){
        List<Opportunity> lstOfOpp = [SELECT Id, Name FROM Opportunity];
        System.debug('>>>>>>>'+lstOfOpp);
        return lstOfOpp;
    }
}