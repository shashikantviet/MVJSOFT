({
	doInit : function(component, event, helper) {
        console.log('Testing');
		var action = component.get('c.getAllData');
        action.setCallback(this, function(res){
            console.log('data==>',res.getState());
            var data = res.getReturnValue();
            console.log('data==>',data);
            component.set('v.columns', data.lstCol);
            component.set('v.data', data.lstOfRec);
        });
        
        $A.enqueueAction(action);
	}
})