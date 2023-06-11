public class TransactionRoleRec {
    
    //Wrapper class
    public class dataWrapper{
        @auraEnabled
        public List<Transaction_Role__c> lstTrans {get;set;}
        
        @auraEnabled
        public List<FieldSetWrapper> lstOfWrap {get;set;}
        
        public dataWrapper(List<Transaction_Role__c> lstTrans, List<FieldSetWrapper> lstOfWrap){
            this.lstTrans = lstTrans;
            this.lstOfWrap = lstOfWrap;
        }
    }
    @auraEnabled
    public static dataWrapper TransactionRec(){
        
        List<FieldSetWrapper> lstWrapper = getFieldSetWrapper('Transaction_Role__c', 'Transaction_field_set');
        List<String> lststr = new List<String>();
        for(FieldSetWrapper obj : lstWrapper){
            lststr.add(obj.fieldPath);
        }
        String separator = ', ';
        String query = 'SELECT Id, Name, '+ String.join(lststr, separator) +' FROM transaction_Role__c';
        System.debug('query==>'+query);
        List<Transaction_Role__c> trans = database.query(query);
        return new dataWrapper(trans, lstWrapper);
    }
    
    @auraEnabled
    public static void  deleteRec(String recId){
        Transaction_Role__c recDel = [SELECT Id FROM transaction_Role__c WHERE Id =:recId];
        delete recDel;
    }
     @AuraEnabled
    public static List<String> getPickListValuesIntoList(){
        System.debug('test');
        List<String> pickListValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Transaction_Role__c.Role__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
        }
        System.debug('pickListValuesList==>'+pickListValuesList);
        return pickListValuesList;
    }
    
    @AuraEnabled
    public static String updateRecord(String jsonObjArr) {
        System.debug('test--->>>'+jsonObjArr);
        jsonObjArr = '[' + jsonObjArr + ']';
        try {
            //System.debug('jsonObjArr::::::'+jsonObjArr);
            Type listType = Type.forName('List<Transaction_Role__c>');
            List<SObject> objs = (List<SObject>)JSON.deserialize(jsonObjArr, listType);
            
            update objs;
        } catch (Exception e) {
           
        }
        return 'success';
    }
    
    @AuraEnabled
    public static transaction_Role__c createRecord(transaction_Role__c newRec) {
        System.debug('newRec===>'+newRec);
        insert newRec;
        return newRec;
    }
    
     // wrapper class for the fieldset
    public class FieldSetWrapper{
        @AuraEnabled
        public String fieldPath { get; set; }
        @AuraEnabled
        public String type { get; set; }

        FieldSetWrapper(Schema.FieldSetMember f) {
            this.fieldPath = f.fieldPath;
            this.type = '' + f.getType();
        }
    }
    
    /**
    * @MethodName : readFieldSet  
    * @params     : 
    * @Description: getting the list of fieldset members. 
    **/
    private static List<Schema.FieldSetMember> readFieldSet(String sObjectName, String fieldSetName){
        Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe();
        System.debug('GlobalDescribeMap==>'+GlobalDescribeMap);
        Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(sObjectName);
        System.debug('SObjectTypeObj==>'+SObjectTypeObj);
        Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();
        Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName);
        System.debug('===>>fieldSetObj.getFields()<<==='+fieldSetObj.getFields());
        return fieldSetObj.getFields();
    }
    
    /**
    * @MethodName : getFieldSetWrapper  
    * @params     : 
    * @Description: getting the list of fieldset wrapper. 
    **/
    private static List<FieldSetWrapper> getFieldSetWrapper(String sObjectName, String fieldSetName){
        List<FieldSetWrapper> lstWrapper = new List<FieldSetWrapper>();
        for(Schema.FieldSetMember objFSM : readFieldSet(sObjectName, fieldSetName)){
            lstWrapper.add(new FieldSetWrapper(objFSM));
        }
        return lstWrapper;
    }
}