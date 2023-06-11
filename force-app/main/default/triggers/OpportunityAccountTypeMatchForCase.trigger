trigger OpportunityAccountTypeMatchForCase on Opportunity (before insert, before update) {    
        OpportunityTriggerHandler.opportunityAccountTypeCheckBeforeInsert(trigger.new);
}