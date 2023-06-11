/*
@ClassName    : FieldSetCon 
@CreatedOn    : 21st Feb, 2018
@CreatedOnBy  : SHASHI KANT
@ModifiedBy   : 
@Description  : This class is used to display the details of the article viewed by an user.
*/
public class FieldSetCon {
    
    //Wrapper class 1
    public class ColWrapper{
        @AuraEnabled
        public String label {get;set;}
        @AuraEnabled
        public String fieldName {get;set;}
        @AuraEnabled
        public String type {get;set;}
        
        public ColWrapper(String label, String fieldName, String type){
            this.label =label;
            this.fieldName=fieldName;
            this.type=type;
        }
        
    }
    
    //Wrapper class 2
    public class DataWrapper{
        @AuraEnabled
        public List<ColWrapper> lstCol {get;set;}
        @AuraEnabled
        public List<Account> lstOfRec {get;set;}
        
        public DataWrapper(List<ColWrapper> lstCol, List<Account> lstOfRec){
            this.lstCol = lstCol;
            this.lstOfRec =lstOfRec;
        }
        
    }
    
    
    public static List<Schema.FieldSetMember> readFieldSet(String fieldSetName, String ObjectName) {
        Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe(); 
        Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(ObjectName);
        Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();
        Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName);
        return fieldSetObj.getFields(); 
    }
    public static List<ColWrapper> getColmns(String fieldSetName, String ObjectName) {
        List<Schema.FieldSetMember> fieldSetMemberList =  readFieldSet(fieldSetName, ObjectName);
        List<ColWrapper> lstColmn = new List<ColWrapper>();
        for(Schema.FieldSetMember fieldSetMemberObj : fieldSetMemberList){
            lstColmn.add(new ColWrapper(fieldSetMemberObj.getLabel()+'', fieldSetMemberObj.getFieldPath()+'', fieldSetMemberObj.getType()+''));
            
        }
        return lstColmn;
    }
    
    @AuraEnabled
    public static DataWrapper getAllData(){
        DataWrapper dw = null; 
        List<ColWrapper> lstOfCol = getColmns('Test1','Account');
        Set<String> setFieldApi = new Set<String>();
        for(ColWrapper str : lstOfCol){
            setFieldApi.add(str.fieldName);
        }
        String query ='select ';
        query += String.join(new List<String>(setFieldApi), ',');
        query += ' from Account';
        List<Account> lstAcc = Database.query(query);
        return new DataWrapper(lstOfCol, lstAcc);
    }
    
    
    
}