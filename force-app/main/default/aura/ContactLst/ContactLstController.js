({
    doInit : function(component, event) {
        var action = component.get("c.findAll");
        console.log('action==>',action);
        action.setCallback(this, function(a) {
            component.set("v.contacts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    searchKeyChange: function(component, event) {
        var searchKey = event.getParam("searchKey");
        var fField = component.get('v.fField');
        if(fField == "Name"){
            var action = component.get("c.findByName");
            action.setParams({
                "searchKey": searchKey
            });
            action.setCallback(this, function(a) {
                component.set("v.contacts", a.getReturnValue());
            });
            $A.enqueueAction(action);
        }else{
            var action = component.get("c.findById");
            action.setParams({
                "contactId": searchKey
            });
            action.setCallback(this, function(a) {
                component.set("v.contacts", a.getReturnValue());
            });
            $A.enqueueAction(action);  
        } 
    },
    
    FilterField: function(component, event) {
        var abc = event.getParam("keyField");
        component.set('v.fField', abc);
    }
})