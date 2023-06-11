global class BatchToCeateAlert implements Database.Batchable<SObject> {
    
   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator('select Id, Name, CloseDate from Opportunity');
   }

   global void execute(Database.BatchableContext BC, List<Opportunity> lstOfOpp){
       System.debug('>>lstOfOpp>>'+lstOfOpp);
       for(Opportunity opp : lstOfOpp){
           if(opp.closeDate > (Date.today() - 60)){
               
           }
       }
    }

   global void finish(Database.BatchableContext BC){
       
   }

}