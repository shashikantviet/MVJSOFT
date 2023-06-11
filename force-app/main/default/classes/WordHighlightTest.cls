public class WordHighlightTest {
    public String searchStr {get;set;}
    public List<Account> searchResult {get;set;}
    
    public WordHighlightTest(){
        searchStr = '';
        searchResult = new List<Account>();
    }
    
    public void testSOSL(){
        searchResult.clear();
        searchResult.addAll(lstRec(searchStr));
    }
    
    public List<Account> lstRec(String searchKey){
        List<Account> lstacc = new List<Account>();
        if(searchKey.length() > 2){
            String query = 'FIND \'' +searchKey+ '\' IN NAME FIELDS RETURNING Account(Description) WITH HIGHLIGHT';
            System.debug('query=====>'+query);	
            
            for(List<Account> acc : search.query(query)){
                lstacc.addAll(acc);
            }
        }
        System.debug('lstacc=====>'+lstacc);	
        return lstacc;
    }
    
}