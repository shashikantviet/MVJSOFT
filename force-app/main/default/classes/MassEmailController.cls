public class MassEmailController {
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName, List<sObject> ExcludeitemsList) {
        String searchKey = '%' + searchKeyWord + '%';
        List < sObject > returnList = new List < sObject > ();
        
        List<string> lstExcludeitems = new List<string>();
        for(sObject item : ExcludeitemsList ){
            lstExcludeitems.add(item.id);
        }
        
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5 and exclude already selected records  
        String sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey AND Id NOT IN : lstExcludeitems order by createdDate DESC limit 5';
        List < sObject > lstOfRecords = Database.query(sQuery);
        
        for (sObject obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
    @AuraEnabled
    public static void sendEmailToSelectedContacts(List<sObject> lstOfSelContacts, String selectedCampaign, String fromAddress, String emailsubject, String emailBody){
        Set<Id> setOfContactIds =  new Set<Id>();
        List<Contact> contacts;
        if(lstOfSelContacts.size() > 0){
            
            for(sObject con : lstOfSelContacts){
                setOfContactIds.add(con.Id);
            }
            System.debug('>>>>setOfContactIds>>>>>'+setOfContactIds);
            contacts = [SELECT Id, email,name FROM contact WHERE Id IN : setOfContactIds AND email != null];
        }else{
            contacts = [SELECT Id, Name, email 
                        FROM Contact 
                        WHERE Id IN (SELECT ContactId FROM CampaignMember WHERE Id = :selectedCampaign AND ContactId != null)];
        }
        
        
        
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        List<Task> lstOfTasks =  new List<Task>();
        for(Contact con : contacts){
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            List<String> addresses = new List<String>();
            email.setSubject(emailsubject);
            email.setHTMLBody(emailBody);
            addresses.add(con.Email);
            email.setToAddresses(addresses);
            emails.add(email);
            String comments = 'To : shashi.yadav@trekbin.com <br/> Subject : '+emailsubject +' <br/> Body : '+emailBody;
            lstOfTasks.add(new Task(WhatId = selectedCampaign, Description = comments, Subject = emailsubject));
        }
        Messaging.SendEmailResult [] res = Messaging.sendEmail(emails);
        Insert lstOfTasks;
        
    }
    
    
}