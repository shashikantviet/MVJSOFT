public class AccDetailPageCon {
    
    public class ResultWrapper {
        
        @AuraEnabled
        public list<SObject> lstSObject;
        @AuraEnabled
        public list<FieldsWrapper> lstFields;
        
        public ResultWrapper(list<SObject> lstSObject, list<FieldsWrapper> lstFields) {
            
            this.lstSObject = lstSObject;
            this.lstFields = lstFields;
        }
    }
    
    public class FieldsWrapper {
        
        @AuraEnabled
        public String fieldPath { get;set; }
        @AuraEnabled
        public String label { get;set; }
        @AuraEnabled
        public String type { get; set; }
        
        public FieldsWrapper(String fieldPath, String label, String type) {
            this.fieldPath = fieldPath;
            this.label = label;
            this.type = type;
        }
    }
    /* @MethodName  :   fetchRecordData
* @Param        :	String strSObjectName, String strFieldsetName, String strRecordId
* @Description  :   gets FieldSet Fields 
*/
    @AuraEnabled
    public static ResultWrapper fetchRecordData(String sObjectName, String fieldsetName, String recordId) {
        Set<String> setFieldsToQuery = new set<String>();
        List<FieldsWrapper> lstFieldsetWrapper = new List<FieldsWrapper>();
        System.debug('sObjectName::'+sObjectName);
        system.debug('fieldsetName::'+fieldsetName);
        system.debug('strRecordId::'+recordId);
        for(Schema.FieldSetMember fieldSetMemberObj : readFieldSet(fieldsetName, sObjectName)) {
				System.debug('fieldSetMemberObj==>'+fieldSetMemberObj);            
            if(String.valueOf(fieldSetMemberObj.getType()).trim() == 'REFERENCE') {
                if(fieldSetMemberObj.getFieldPath().toLowerCase().endsWith('__c')){
                    setFieldsToQuery.add(fieldSetMemberObj.getFieldPath().toLowerCase().replace('__c','__r.Name'));
                }
                else if(fieldSetMemberObj.getFieldPath().toLowerCase().endsWith('id')){
                    setFieldsToQuery.add(fieldSetMemberObj.getFieldPath().toLowerCase().replace('id','.Name'));
                }
            }
            setFieldsToQuery.add(fieldSetMemberObj.getFieldPath().toLowerCase());
            system.debug('===setFieldsToQuery==='+setFieldsToQuery);
            lstFieldsetWrapper.add(new FieldsWrapper(fieldSetMemberObj.getFieldPath(), fieldSetMemberObj.getLabel(), String.valueOf(fieldSetMemberObj.getType())));
            system.debug('===lstFieldsetWrapper==='+lstFieldsetWrapper);
        }
        
        String queryString = 'Select id, ';
        setFieldsToQuery.remove('id');
        queryString += String.join( new List<String>(setFieldsToQuery), ',');
        queryString.removeEnd(',');
        queryString += ' FROM ' + sObjectName + ' Where Id = \'' + recordId + '\' FOR REFERENCE';       
        
        system.debug('Final Query::'+queryString);
        list<SObject> lstSObject = Database.query(queryString);
        System.debug('>>>>>>>>>>lstSobject>>>'+lstSObject);
        System.debug('>>>>>>>>>>Result lstSObject lstFieldWrapper>>>>>>'+new ResultWrapper(lstSObject, lstFieldsetWrapper));
        return new ResultWrapper(lstSObject, lstFieldsetWrapper);
    }
    
    
    /* @MethodName  :   UpdateRecord
* @Param        :	String sobjRec, String SObjectName
* @Description  :   updates FieldSet Fields 
*/
    @AuraEnabled
    public static void UpdateRecord(Object sObjRecValue, String sobjRec, String SObjectName, String recdId){
        /* create an SObject dynamically:*/  
        
        SObject sObj = Schema.getGlobalDescribe().get(SObjectName).newSObject() ;
        System.debug('==value for Schema.getGlobalDescribe().get(SObjectName)===='+ Schema.getGlobalDescribe().get(SObjectName));
        System.debug('===sObj==='+sObj);
        List<FieldsWrapper> lstFieldSetInfo  = (List<FieldsWrapper>) JSON.deserializeStrict(sobjRec, List<FieldsWrapper>.class);
        System.debug('lstFieldSetInfo---==='+lstFieldSetInfo);
        
        System.debug('recordId====>>'+recdId);
        for(FieldsWrapper key : lstFieldSetInfo){
            
            Object str = sObj.get(key.fieldPath);
            sObj.Id = recdId;
            sObj.put(key.fieldPath ,str);
            System.debug('==Field path==> '+ key.fieldPath);
        }
        
        
        System.debug('Inside update method sobjRecValue' +sObjRecValue);
        System.debug('Inside update method SObjectName' +SObjectName);
        Map<String, object> cObjMap  = (Map<String, object>) sObjRecValue ;
        System.debug('Inside update method= sobject==='+sObj);
        System.debug('Inside update method= cObjMap==='+cObjMap);
        System.debug('sObj before update===========>>'+ sObj);
        for(String strKey : cObjMap.keySet() ) {
            System.debug('strKey--->>'+strKey);
            Object str = cObjMap.get(strKey);
            System.debug('str--->>'+str);
            sObj.put(strKey , str);
            System.debug('===Mapval==='+sObj);
        }
        update sObj; 
        System.debug('sObj after update===========>>'+ sObj);
    }
    
    private static List<Schema.FieldSetMember> readFieldSet(String fieldSetName, String ObjectName) {
        Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe(); 
        Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(ObjectName);
        Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();
        Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName);
        return fieldSetObj.getFields(); 
    }
}