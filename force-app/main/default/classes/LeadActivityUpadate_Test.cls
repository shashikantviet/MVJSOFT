@isTest
public class LeadActivityUpadate_Test {
    static testMethod void validateActivityUpdate(){
        Lead newrec=new Lead(LastName='Yadav', Company='trekbin', Status='Open');
        insert newrec;
		Task newTask = new Task(OwnerId = UserInfo.getUserId(), Subject='Donni', Status='Not Started', Priority='Normal',WhoId=(Id)newrec.Id);
        insert newTask;
        LeadActivityUpadate testActivityUpdate = new LeadActivityUpadate();
        database.executebatch(testActivityUpdate);
    }
}