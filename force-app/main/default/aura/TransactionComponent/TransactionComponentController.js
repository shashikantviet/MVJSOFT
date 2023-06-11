({
    doInit : function(component, event, helper) {
        helper.loadContacts(component);
        component.set("v.sortAsc", true);
        helper.sortBy(component,"Name");
        console.log('before call');
        helper.getpicklistValue(component);
        
    },
    
    doSorting : function(component, event, helper){
        var fieldName = event.currentTarget.id;
        var sortFld = component.get('v.sortField');
        var sortdir = component.get('v.sortAsc');
        if(sortFld == fieldName ){
            if(sortdir){
                component.set('v.sortAsc',false);
            }else{
                component.set('v.sortAsc',true);
            }
        }else{
            component.set('v.sortField',fieldName);
        }
        helper.sortBy(component,fieldName);
        
    },
    
    delRec : function(component, event, helper){
        var del = component.get("c.deleteRec");
        var iconId = event.currentTarget.id;
        del.setParams({
            recId : iconId
        });
        del.setCallback(this,function(result){
            helper.loadContacts(component); 
        });
        
        $A.enqueueAction(del);
    },
    
    editRec : function(component, event, helper){
        var index = event.currentTarget.id;
        var allRec = component.get("v.transactionDeatil");
        component.set('v.record',allRec[index]);
        component.set('v.isEdit',true);
        
    },
    
    closeWindow : function(component, event, helper) {
        component.set('v.isEdit',false);
        component.set('v.isCreate',false);
    },
    
    showInputbox : function(component, event, helper) {
        var value = component.find('searchblock');
         $A.util.toggleClass(value, 'slds-hide');
    },
    
    updateRec :  function(component, event, helper) {
        var record = JSON.stringify(component.get('v.record'));
        var action = component.get("c.updateRecord");
        action.setParams({
            jsonObjArr : record
        });
        action.setCallback(this,function(result){
            helper.loadContacts(component);
            
        });
        
        $A.enqueueAction(action);
        component.set('v.isEdit',false);
    },
    updateField : function(component, event, helper) {
        var fieldName = event.currentTarget.id;
        var value = event.currentTarget.value;
        var record = component.get('v.record');
        console.log('record==>',record);
        record[fieldName] = value;
        component.set('v.record',record);
        console.log('changedRecord==>',record);
    },
    
    searchKeyChange : function(component, event, helper){
        var fullName = component.find("keyWord").get("v.value");
        var data = component.get("v.transactionDeatil");
        var datas =component.get("v.filterDatas");
        var filterData = datas.filter(e => e['Name'].includes(fullName))
        if(fullName == ''){
            component.set('v.transactionDeatil',datas);
        }else{
        component.set('v.transactionDeatil',filterData);
        }
        
    },
    
    createRec :function(component, event, helper){
        component.set('v.isCreate',true);
    },
    
    createNewRec : function(component, event, helper){
        var record = component.get("v.newRecods");
        var action = component.get("c.createRecord");
        action.setParams({
            "newRec" : record
        });
       action.setCallback(this, function(a) {
            var state = a.getState();
            if(state == "SUCCESS"){
                var ret = a.getReturnValue();
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title" : "Success Message",
                    "message": "Record Saved Successfully!",
                     "type": "success" 
                });
                $A.get('e.force:refreshView').fire();
                toastEvent.fire();
                
            }  
            
        });
        $A.enqueueAction(action);
        component.set('v.isCreate',false);
        /*component.set('v.newRecods','');
        this.doInit(component, event, handler);*/
    }
})