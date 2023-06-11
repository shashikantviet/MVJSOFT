({
    doInit : function(component, event, helper) {
        var recVal = component.get("v.objRec");
        console.log('==Rec Values==', recVal);
        helper.passValues(component, event, helper);
    },
    
    edit : function(component, event, helper){
        console.log("===inside edit==");
        component.set("v.edit", true);
        var editfld = component.get("v.edit");
        console.log('editfield editable--->>', editfld);
    },
    
    save : function(component, event, helper){
        component.set("v.edit", false);
        helper.saveRecords(component, event, helper);
    },
    
    cancel : function(component, event, helper){
        component.set("v.edit", false);
        var editfld = component.get("v.edit");
        console.log('editfield editable--->>', editfld);
    }
    
})