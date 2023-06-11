({
    doInit : function(component, event, helper) {
        var rec = component.get('v.objRec');
        var apiName = component.get('v.fieldApi');
        console.log('apiName==>',apiName);
        console.log('fieldType', component.get('v.fieldType'));
        console.log('index==>',rec[apiName]);
        component.set('v.fieldVal', rec[apiName]);
        console.log('fieldValue==>',component.get('v.objRec'));
    }
})