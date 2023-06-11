public with sharing class RemindOpportunityOwners {
    public static void createTaskforOpp(List<Opportunity> oppList) {
        
        List<Task> taskList = new List<Task>();
        For(Opportunity opp : oppList) {
            Task newTask = new Task(
                WhatId = opp.Id,
                OwnerId = opp.OwnerId,
                ActivityDate = Date.today(),
                Subject = 'Update Opportunity',
                Description = 'Kindly close the ticket by the end of the day');
            taskList.add(newTask);
        }
        insert taskList;
    }
}