({
    init : function(component, event, helper) {
        var objRecVal = component.get('v.objRecVal');
        var FieldapiName = component.get('v.fieldAPI');
        var objName = component.get('v.objectName');
        
        console.log('object with field in string value=======>>>',objRecVal);
        console.log('SobjName=======>>>',objName);
        console.log('fieldSetFieldapiName=======>>>',FieldapiName);
        
        var recordVal = objRecVal[FieldapiName];	
        console.log('FieldData=======>>>', recordVal);
        component.set('v.fieldVal', recordVal);
        
    },
    
    
    updateRecVal : function(component, event, helper){
        console.log('===Inside child controller======fieldVal==', component.get('v.fieldVal'));
        var FieldapiName = component.get('v.fieldAPI');
        var objRecValue = component.get('v.objRecVal');
        objRecValue[FieldapiName] = component.get('v.fieldVal');
        component.set("v.objRecVal", objRecValue);
        console.log('objRecVal=======>>>',objRecValue);
    }
})