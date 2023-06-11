({
    selectRecord : function(component, event, helper){      
        // get the selected record from list  
        var getSelectRecord = component.get("v.oRecord");
        var selectedRecId =  component.get("v.oRecord.Id");
        console.log('selectedRecId in clild>>>>>>>>>',selectedRecId);
        // call the event   
        var compEvent = component.getEvent("oSelectedRecordEvent");
        // set the Selected sObject Record to the event attribute.  
        compEvent.setParams({
            "recordByEvent" : getSelectRecord,
            "hidesearchicon" : false,
            "sObjName" : component.get("v.sObjName"),
            "selectedRecId" : selectedRecId
        });  
        // fire the event  
        compEvent.fire();
    },
})