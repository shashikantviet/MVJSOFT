public class ContentVersionHelper {
    
    public Static void removeOldContentVersionfromContentDocument(List<ContentVersion> lstOfCV){
        Set<Id> setOfContentDocumentId =  new Set<Id>();

        for(ContentVersion cv : lstOfCV){
            setOfContentDocumentId.add(cv.ContentDocumentId);
        }
        
        Map<Id,ContentDocument> mapOdIdAndCntntDcmnt = new Map<Id,ContentDocument>([SELECT ID, Title 
                                                  FROM ContentDocument
                                                  WHERE ID IN: setOfContentDocumentId]);

        System.debug('>>>>mapOdIdAndCntntDcmnt>>>>>>>'+mapOdIdAndCntntDcmnt);
                                           
       /* List<ContentDocumentLink> lstOfCDL = [SELECT ContentDocumentId, LinkedEntityId 
                                                FROM ContentDocumentLink 
                                                WHERE ContentDocumentId IN:setOfContentDocumentId];
         System.debug('>>>>lstOfCDL>>>>>>>'+lstOfCDL);*/
         List<ContentDocumentLink> lstOfCDL = new List<ContentDocumentLink>();

         for(ContentDocumentLink CDL :[SELECT ContentDocumentId, LinkedEntityId 
                                                FROM ContentDocumentLink 
                                                WHERE ContentDocumentId IN:setOfContentDocumentId] ){

         }


        
    }

}