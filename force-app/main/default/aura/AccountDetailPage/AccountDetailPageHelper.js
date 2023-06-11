({
    passValues : function(component, event, helper) {
        var objApi = component.get("v.ObjName");
        var recordId = component.get("v.recordId");
        console.log("===objApi===>>"+objApi);
        console.log("===recordId===>>"+recordId);
        var fieldSetApi = component.get("v.fieldSetName");
        console.log("===FieldsetApi===>>"+fieldSetApi);
        var action = component.get("c.fetchRecordData");
        
        action.setParams({
            'fieldsetName' : component.get("v.fieldSetName"),
            'sObjectName' : component.get("v.ObjName"),
            'recordId' : component.get("v.recordId")
        });
        
        action.setCallback(this, function(response) { 
            helper.handleCallback(component, event, helper, response); 
        });
        $A.enqueueAction(action);
    },
    
    
    handleCallback : function(component, event, helper, response){
        if (response.getState() === 'SUCCESS') { 
            var retJSON = response.getReturnValue();  
            console.log("============retJSON.lstFields====", retJSON.lstFields); 
            var objSObject = retJSON.lstSObject[0];
            console.log("============objSObject ====", objSObject);
            component.set("v.objRec", objSObject);
            component.set("v.listFieldset", retJSON.lstFields); 
            
            
        }
    },
    
    saveRecords : function(component, event, helper){
        console.log('inside save');
        
        var objName = component.get("v.ObjName");
        var recId = component.get("v.recordId");
        var objRecord = component.get("v.objRec");
        console.log('inside save objRecord',objRecord);
        var fieldInfo = component.get("v.listFieldset");
        console.log('inside save objname',objName);
        console.log('inside save objRecord',JSON.stringify(objRecord));
        console.log('inside save recordId',recId);
        console.log('inside save fieldlists',JSON.stringify(fieldInfo));
        var action = component.get("c.UpdateRecord");
        
        action.setParams({ 
            "sObjRecValue" : objRecord,
            "sobjRec" : JSON.stringify(fieldInfo),
            "SObjectName" : objName,
            "recdId": recId
        });
        action.setCallback(this, function(response) { 
            console.log('response.getState()=====>>', response.getState());
            
            if(response.getState() === 'SUCCESS') 
                alert('saved successfully');
            else
                alert('Error in saving');
        }); 
        $A.enqueueAction(action);
    }
    
})