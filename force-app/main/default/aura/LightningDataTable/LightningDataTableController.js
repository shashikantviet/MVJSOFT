({
    doInit : function(component, event, helper) {
        console.log('>>>recordID',component.get("v.recordId"));
        console.log('>>>recordID',component.get("v.sobjecttype"));        
        helper.getDataHelper(component, event);
    },
})