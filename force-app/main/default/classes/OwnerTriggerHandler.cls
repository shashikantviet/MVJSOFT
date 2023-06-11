public class OwnerTriggerHandler {
    //Constructor of class
    public OwnerTriggerHandler(){

    }
    
    public void onAfterInsert(List<Owner__c> lstOFIds){
        set<Id> setOfIds = new set<Id>();
        for(Owner__c obj :lstOFIds){
            setOfIds.add(obj.Id);
        }
        
        List<Owner__c> lstToUpadte = new List<Owner__c>();
        for(Owner__c own : [select OwnerId, Owner.Name from Owner__c where Id IN : setOfIds]){
            own.OwnersName__c = (String)own.Owner.Name;
            System.debug('own.OwnersName__c==>' +own.OwnersName__c);
            lstToUpadte.add(own);
        }
        update lstToUpadte;
    }
    public void onAfterUpdate(List<Owner__c> lstOfIds){
        set<Id> setOfIds = new set<Id>();
        for(Owner__c obj :lstOFIds){
            setOfIds.add(obj.Id);
        }
        List<Owner__c> lstToUpadte = new List<Owner__c>();
        for(Owner__c own : [SELECT Id, Name FROM Owner__c WHERE Id IN : setOfIds]){
            own.OwnersName__c = own.Name;
            lstToUpadte.add(own);
        }
        update lstToUpadte;
    }
}