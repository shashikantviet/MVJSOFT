public class TriggerHandlerOnAccount {
    public TriggerHandlerOnAccount(){
        
    }
    public void insertContact(List<Contact> lstCon){
        List<String> setOfEmails= new List<String>();
        for(Contact con : lstCon){
            if(con.Email != null){
                setOfEmails.add(con.Email);
            }
        }
        List<Contact> lstRelatedCon = [SELECT ID, Email FROM Contact Where Email IN :setOfEmails];
        System.debug('>>>>>lstRelatedCon>>>>'+lstRelatedCon);
        for(Contact con : lstRelatedCon){
            if(setOfEmails.Contains(con.Email)){
                con.Email.addError('Another new Contact has the '
                                    + 'same email address.');
            }
        }
        if(lstRelatedCon.size() < 0){
             Insert lstCon;
        }
    }
}