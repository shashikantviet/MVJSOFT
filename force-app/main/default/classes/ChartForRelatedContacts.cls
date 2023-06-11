public with sharing class ChartForRelatedContacts {
    public class wrapReportDetailWithId{
        @AuraEnabled
        public Id reportId;
        @AuraEnabled
        public String reportDetail;
        wrapReportDetailWithId(Id reportId, String reportDetail){
            this.reportId= ReportId;
            this.reportDetail = reportDetail;
        }
    }
    
    
    @AuraEnabled
    public static wrapReportDetailWithId getRelatedContacts(){
        system.debug('*****');
        Report repRec=[SELECT Id,Name,DeveloperName from Report where DeveloperName=:'Contacts_Related_To_Accounts_Ftn'];
        Reports.ReportResults reportResult =
            Reports.ReportManager.runReport(repRec.Id, true);
        System.debug('list-------'+reportResult);
        return new wrapReportDetailWithId(repRec.Id, JSON.serialize(reportResult));
    }
}