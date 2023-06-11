public class OpportunityTriggerHandler {
    public static void opportunityAccountTypeCheckBeforeInsert(List<Opportunity> lstOfOprtnty){
        System.debug('>>>lstOfOprtnty>>>>'+lstOfOprtnty);
        List<Case> lstOfCase =  new List<Case>();
        Map<Id, String> mapOfAccountIdAndOppType =  new Map<Id, String>();
        Set<Id> setOfAccountIds =  new Set<Id>();
        for(Opportunity opp : lstOfOprtnty){
            if(opp.AccountId != null){
                mapOfAccountIdAndOppType.put(opp.AccountId, opp.Type);
                setOfAccountIds.add(opp.AccountId);
            }
            
        }
        for(Account acc : [SELECT ID, custom_Type__c FROM Account Where ID IN: setOfAccountIds]){
            if(mapOfAccountIdAndOppType.containsKey(acc.Id)){
                if(mapOfAccountIdAndOppType.get(acc.Id) == acc.Custom_Type__c){
                    //create new Case;
                    lstOfCase.add(new Case(Subject = 'Opportunity matched with Account', AccountId =acc.Id, Type='Mechanical', Status ='New', Priority = 'Medium', Origin = 'Email'));
                }
                
            }
        }
        System.debug('>>>lstOfCase>>>>>>>'+lstOfCase);
        Insert lstOfCase;
        
    }

}