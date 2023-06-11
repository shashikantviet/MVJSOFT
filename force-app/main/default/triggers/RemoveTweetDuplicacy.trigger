trigger RemoveTweetDuplicacy on Tweet__c (before insert, before update) {
    for(Tweet__c objTweet : Trigger.new){
        Integer count = [SELECT count() from Tweet__c where Name =: objTweet.Name];
        if(count >0)
            objTweet.Name.addError('duplicate values');
    }
}