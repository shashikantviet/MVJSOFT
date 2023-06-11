public class EnquiryController {
    private static string secret = '6Lc7OLgUAAAAAJRCitcLFk9LYxSJl3O5YHJRZkf4';
    public string publicKey { get { return '6Lc7OLgUAAAAAJfKBgaJCy-ywVq427AoWgX-7Uy9' ; }}
    private static string baseUrl = 'https://www.google.com/recaptcha/api/verify';
    public string challenge {get; set;} { challenge = null; }
    public string response {get; set; } { response = null; }
    public Enquiry__c enquiryObj{get;set;}
    public Boolean correctResponse { get; private set; } { correctResponse = false; }
 
    public EnquiryController() {
        enquiryObj = new Enquiry__c();
    }
 
    public pageReference verifyAndSubmit() {
        if ( challenge == null || response == null ) {
            return null;
        }
        HttpResponse r = makeRequest( baseUrl ,'privatekey='+ secret +
                                      '&remoteip=' + remoteHost +
                                      '&challenge=' + challenge +
                                      '&response=' + response +
                                      '&error=incorrect-captcha-sol'
                         );
        if ( r != null ) {
            correctResponse = ( r.getBody().contains('true') );
            if( correctResponse == true ) {
                insert enquiryObj;
            }else{
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please fill the value in                                                                   CAPTCHA properly.');
                ApexPages.addMessage(myMsg);
                return NULL;
            }
        }
        return null;
    }
 
    public static HttpResponse makeRequest(string url, string body) {
        HttpRequest req = new HttpRequest();
        HttpResponse response = null;
        req.setEndpoint( url );
        req.setMethod('POST');
        req.setBody ( body);
        try {
            Http http = new Http();
            response = http.send(req);
        }catch( System.Exception e) {
            System.debug('ERROR: '+ e);
        }
        return response;
    }
 
    public string remoteHost {
        get{
            string ret = '127.0.0.1';
            // also could use x-original-remote-host
            map<string , string> hdrs = ApexPages.currentPage().getHeaders();
            if ( hdrs.get('x-original-remote-addr') != null)
                ret = hdrs.get('x-original-remote-addr');
            else if ( hdrs.get('X-Salesforce-SIP') != null)
                ret = hdrs.get('X-Salesforce-SIP');
            return ret;
        }
    }
}