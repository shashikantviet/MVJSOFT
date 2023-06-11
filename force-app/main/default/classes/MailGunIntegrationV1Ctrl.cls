/*
Send email using MailGun

*/

public with sharing class MailGunIntegrationV1Ctrl {
    
    private static final String API_KEY = '';
    private static final String SENDER_DOMAIN = '';
    private static final String API_URL = 'https://api.mailgun.net/v3/' + SENDER_DOMAIN + '/messages';
    private static final String SENDER_EMAIL = 'noreply@' + SENDER_DOMAIN;
    private static final String SENDER_NAME = '';
    
    public MailGunIntegrationV1Ctrl() {
        
    }
    
    public static void sendEmail(String toEmail, String toName, String subject, String htmlBody) {
        
        System.debug('htmlBody--: ' + htmlBody);
        String sBody = 'from=' + SENDER_NAME + ' ' +
            '&to=' + toName + ' &subject=' + subject + '&html=' + htmlBody;
        Blob headerValue = Blob.valueOf('api'+ ':' + API_KEY);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        req.setHeader('Accept', 'application/json, application/xml, text/json, text/x-json, text/javascript, text/xml, application/json');
        req.setHeader('Host', 'api.mailgun.net');
        req.setBody(sBody);
        req.setHeader('Content-Length', string.valueOf(sBody.length()));
        req.setEndPoint(API_URL);
        req.setMethod('POST');
        req.setBody(sBody);
        System.debug('email req: ' + req);
        HttpResponse res = new Http().send(req);
        System.debug('email response: ' + res);
        //return res.getStatusCode() == 200;
    }
    
    /*public static void sendEmailWithAttachment(String toEmail, String toName, String subject, String htmlBody,String attId) {
        Attachment d = [SELECT Id,Name,Body FROM Attachment WHERE Id =:attId LIMIT 1];
        System.debug('att: ' + d);
        String boundary = '----------------------------741e90d31eff';
        String header = '';
        header += '--'+boundary+'\r';
        header += 'Content-Disposition: form-data; name="to"\r\r'+ toName + ' \r';
        header += '--'+boundary+'\r';
        header += 'Content-Disposition: form-data; name="from"\r\r'+ SENDER_NAME + ' \r';
        header += '--'+boundary+'\r';
        header += 'Content-Disposition: form-data; name="subject"\r\r'+ subject +'\r';
        header += '--'+boundary+'\r';
        header += 'Content-Disposition: form-data; name="html"\r\r'+ htmlBody +'\r';
        
        String footer = '--'+boundary+'--';
        String headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\r\r'));
        
        while(headerEncoded.endsWith('=')) {
            header += ' ';
            headerEncoded = EncodingUtil.base64Encode(Blob.valueOf(header+'\r\r'));
        }
        
        String attachmentsStr = '';
        String lastPrepend = '';
        
        Blob fileBlob = d.Body;
        String filename = d.Name;
        String fHeader = lastPrepend + '--'+boundary+'\r';
        fHeader += 'Content-Disposition: form-data; name="attachment"; filename="'+filename+'"\r\nContent-Type: application/octet-stream';
        String fHeaderEncoded = EncodingUtil.base64Encode(Blob.valueOf(fheader+'\r\r'));
        
        while(fHeaderEncoded.endsWith('=')) {
            fHeader += ' ';
            fHeaderEncoded = EncodingUtil.base64Encode(Blob.valueOf(fHeader+'\r\r'));
        }
        
        String fbodyEncoded = EncodingUtil.base64Encode(fileBlob);
        String last4Bytes = fbodyEncoded.substring(fbodyEncoded.length()-4,fbodyEncoded.length());
        
        if(last4Bytes.endsWith('==')) {
            last4Bytes = last4Bytes.substring(0,2) + '0K';
            fBodyEncoded = fbodyEncoded.substring(0,fbodyEncoded.length()-4) + last4Bytes;
            lastPrepend = '';
        } else if(last4Bytes.endsWith('=')) {
            last4Bytes = last4Bytes.substring(0,3) + 'N';
            fBodyEncoded = fbodyEncoded.substring(0,fbodyEncoded.length()-4) + last4Bytes;
            lastPrepend = '';
        } else {
            lastPrepend = '\r';
        }
        attachmentsStr += fHeaderEncoded + fBodyEncoded;
        footer = lastPrepend + footer;
        
        String footerEncoded = EncodingUtil.base64Encode(Blob.valueOf(footer));
        Blob bodyBlob = EncodingUtil.base64Decode(headerEncoded+attachmentsStr+footerEncoded);
        Blob headerValue = Blob.valueOf('api'+ ':' + API_KEY);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type','multipart/form-data; boundary='+boundary);
        req.setHeader('Host', 'api.mailgun.net');
        req.setBodyAsBlob(bodyBlob);
        req.setEndPoint(API_URL);
        req.setMethod('POST');
        
        HttpResponse res = new Http().send(req);
        System.debug('email response: ' + res);
    }*/
}