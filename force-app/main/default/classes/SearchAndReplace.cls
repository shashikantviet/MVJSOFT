global class SearchAndReplace implements Database.Batchable<Sobject> {
    global final String Query;
    global final String Entity;
    global final String Field;
    global final String Value;
	
    global SearchAndReplace(String Query,String Entity, String Field, String Value){
        this.Query= Query;
        this.Entity = Entity;
        this.Field= Field;
        this.Value= Value;
    }
    global Database.QueryLocator start(Database.BatchableContext BC){
        System.debug('BC==>' +BC);
        System.debug('query==>'+query);
        return Database.getQueryLocator(query);
        
    }
    
    global void execute(Database.BatchableContext BC ,List<Sobject> scope){
        for(sobject s : scope){
            s.put(Field,Value); 
        }
        System.debug('scope==>'+scope);
        update scope;
        
    }
    global void finish(Database.BatchableContext BC){
        
    }
}