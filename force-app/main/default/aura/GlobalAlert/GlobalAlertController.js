({
	getAllContacts : function(component, event, helper) {
        
		 var action = component.get("c.getcontacts");
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var ret = response.getReturnValue();
                component.set("v.getcontacts",ret);
            }
                
        });
        $A.enqueueAction(action);
	},
    
    sortByName: function(component, event, helper) {
        helper.sortBy(component, "Name");
    },
    sortByAmount: function(component, event, helper) {
        helper.sortBy(component, "Amount");
    }
})