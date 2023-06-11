public class GraphController {
    
    @auraEnabled
    public List<LineChartVar> myLineChartVarList;
    
    public class LineChartVar {
        string label;
        integer firstValue;
        integer secondValue;       
        
        public LineChartVar(string a, integer b, integer c){
            label = a;
            firstValue = b;
            secondValue = c;
        } 
    }
    
    @AuraEnabled
    public static Map<string, integer> getChartMap(){
        Map<String, Integer> mp = new Map<String, Integer>();
        Map<Id, Integer> mapOfAccountIdWithItsContactNum =  new Map<Id, Integer>();
        Map<Id, Account> mapOfIdWithAccount = new Map<Id, Account>([SELECT Id, Name FROM Account]);
        List<Contact> lstOfContacts = [SELECT ID, AccountId FROM Contact WHERE AccountId IN:mapOfIdWithAccount.keySet()];
        
        for(Contact con :lstOfContacts){
            
            if(mapOfAccountIdWithItsContactNum.containsKey(con.AccountId)){
                
                mapOfAccountIdWithItsContactNum.put(con.AccountId, (Integer)mapOfAccountIdWithItsContactNum.get(con.AccountId)+1);
            }else{
                
                mapOfAccountIdWithItsContactNum.put(con.AccountId, 1);
            }
        }
        
        for(Account accObj :mapOfIdWithAccount.Values()){
            
            if(mapOfAccountIdWithItsContactNum.containsKey(accObj.Id)){
                
                mp.put((String)accObj.Name, (Integer)mapOfAccountIdWithItsContactNum.get(accObj.Id));
            }
        } 
        
        return mp;
    }
    
    @AuraEnabled
    public static string getLineChartMap(){
        List<LineChartVar> myLineChartVarList = new List<LineChartVar>();
        
        myLineChartVarList.add(new LineChartVar('2010', 10, 12));
        myLineChartVarList.add(new LineChartVar('2011', 12, 15));
        myLineChartVarList.add(new LineChartVar('2012', 17, 19));
        myLineChartVarList.add(new LineChartVar('2013', 19, 17));
        myLineChartVarList.add(new LineChartVar('2014', 21, 15));
        myLineChartVarList.add(new LineChartVar('2015', 17, 20));
        myLineChartVarList.add(new LineChartVar('2016', 18, 16));        
        return JSON.Serialize(myLineChartVarList);
    }
}