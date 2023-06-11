/**
* Class Name: AttachmentTriggerHandler
* Description: Called due to countTotalNumberOfAttachment method
*/
public class AttachmentTriggerHandler {
    //creating Default Constructor
    public AttachmentTriggerHandler(){
        
    }
    
    /**
* Method Name: CountTotalNumberOfAttachment
* Params     : Map<Id,Integer>,Attachment,Case,AggregateResult
* Description: Calling This Method on After (Insert and Delete) of Attachment in Case sObject
To count the Total number Of Attachments
*/
    Map<ID, Integer > mapOfCounts =  new Map<ID, Integer>();
    public void countTotalNumberOfAttachment( List<Attachment> records ){
        
        for(Attachment record : records){
            System.debug('Case.SObjectType>>'+Case.SObjectType);
            System.debug('record.ParentId.getSObjectType()>>'+record.ParentId.getSObjectType());
            if(record.ParentId.getSObjectType() == Case.SObjectType){
                Integer countAtt = [SELECT count() FROM attachment WHERE ParentId =:record.ParentId];
                System.debug('countAtt>>'+countAtt);
                Case updateCase = [SELECT ID, Attachment_Count__c FROM Case WHERE Id =:record.ParentId];
                mapOfCounts.put(updateCase.Id, countAtt);
                System.debug('updateCase>>'+mapOfCounts);
            }
        }
        
        if(!mapOfCounts.isEmpty()){
            Case[] cases = [SELECT Id FROM Case WHERE Id IN : mapOfCounts.keySet() FOR UPDATE];
            for(Case record: cases){
                record.Attachment_Count__c = mapOfCounts.get(record.Id);
            }
            update cases;
        }
        
    } 
}