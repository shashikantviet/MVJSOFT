({
	createContact : function(component, event, helper) {
        var recDetail = component.get("v.newContact");
        var action = component.get("c.newContactInsert");
        var conDeatil = component.find('contactDetail');
        action.setParams({
            "con" : recDetail
        });
        action.setCallback(this, function(a){
            var state = a.getState();
            if(state === "SUCCESS"){
                var ret = a.getReturnValue();
                console.log('===>',ret);
                var lst = component.get("v.returnContact");
                lst.push(ret);
                console.log('lst====',lst);
                component.set("v.returnContact",lst);
                console.log('===>',component.set("v.returnContact",lst));
            }
        });
		 $A.enqueueAction(action);
        $A.util.removeClass(conDeatil, 'slds-hide');
        component.set("v.newContact",{'sobjectType':'Contact',
                'FirstName': '',
                'LastName': '',
                'Phone': '',
                'Birthdate': ''});

	},
    removeModel: function(component, event, helper) {
        console.log('esryvujlkm');
        var cmpTarget = component.find('mainDiv');
        $A.util.addClass(cmpTarget, 'slds-hide');
    }

})