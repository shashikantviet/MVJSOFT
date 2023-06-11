({
    doInit : function(component,event,helper){
        var action = component.get("c.getCurrentRecorddetails");
        console.log('action>>>>>>>',action);
        console.log('>>>>----',component.get("v.recordId"));
        action.setParams({ recordId : component.get("v.recordId") });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                component.set("v.currentLeadRec",result);
                component.set("v.Street",result.Street);
                component.set("v.City",result.City);
                component.set("v.State",result.State);
                component.set("v.Country",result.Country);
                component.set("v.PostalCode",result.PostalCode);
            }
        });
        $A.enqueueAction(action);
    },
    
    onfocus : function(component,event,helper){
        component.set("v.SobjectName","Account");
        var SobjectName = component.get("v.SobjectName");
        $A.util.addClass(component.find("mySpinner"), "slds-show");
        var forOpen = component.find("searchRes");
        $A.util.addClass(forOpen, 'slds-is-open');
        $A.util.removeClass(forOpen, 'slds-is-close');
        var getInputkeyWord = '';
        helper.searchHelper(component,event,getInputkeyWord,SobjectName,'');
    },
    
    onfocus2 : function(component,event,helper){
        component.set("v.SobjectName","Opportunity");
        var SobjectName = component.get("v.SobjectName");
        $A.util.addClass(component.find("mySpinner2"), "slds-show");
        var forOpen = component.find("searchRes2");
        $A.util.addClass(forOpen, 'slds-is-open');
        $A.util.removeClass(forOpen, 'slds-is-close');
        var getInputkeyWord = '';
        helper.searchHelper(component,event,getInputkeyWord,SobjectName,'');
    },
    
    onfocus3 : function(component,event,helper){
        component.set("v.SobjectName","Contact");
        var SobjectName = component.get("v.SobjectName");
        $A.util.addClass(component.find("mySpinner3"), "slds-show");
        var forOpen = component.find("searchRes3");
        $A.util.addClass(forOpen, 'slds-is-open');
        $A.util.removeClass(forOpen, 'slds-is-close');
        var getInputkeyWord = '';
        var SelectedAccId = component.get("v.SelectAccId");
        helper.searchHelper(component,event,getInputkeyWord,SobjectName,SelectedAccId);
    },
    
    onblur : function(component,event,helper){       
        component.set("v.listOfSearchRecords", null );
        var forclose = component.find("searchRes");
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
    },
    
    onblur2 : function(component,event,helper){       
        component.set("v.listOfSearchRecords", null );
        var forclose = component.find("searchRes2");
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
    },
    
    onblur3 : function(component,event,helper){       
        component.set("v.listOfSearchRecords", null );
        var forclose = component.find("searchRes3");
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
    },
    
    keyPressController : function(component, event, helper) {
        var getInputkeyWord = component.get("v.SearchKeyWord");
        console.log('Acc Key press',getInputkeyWord);
        component.set("v.SobjectName","Account");
        var SobjectName = component.get("v.SobjectName");
        if( getInputkeyWord.length > 0 ){
            var forOpen = component.find("searchRes");
            $A.util.addClass(forOpen, 'slds-is-open');
            $A.util.removeClass(forOpen, 'slds-is-close');
            helper.searchHelper(component,event,getInputkeyWord,SobjectName);
        }
        else{  
            component.set("v.listOfSearchRecords", null ); 
            var forclose = component.find("searchRes");
            $A.util.addClass(forclose, 'slds-is-close');
            $A.util.removeClass(forclose, 'slds-is-open');
        }
    },
    
    keyPressController2 : function(component, event, helper) {
        var getInputkeyWord = component.get("v.SearchConKeyWord");
        console.log('Cont Key press',getInputkeyWord);
        component.set("v.SobjectName","Opportunity");
        var SobjectName = component.get("v.SobjectName");
        if( SearchConKeyWord.length > 0 ){
            var forOpen = component.find("searchRes2");
            $A.util.addClass(forOpen, 'slds-is-open');
            $A.util.removeClass(forOpen, 'slds-is-close');
            helper.searchHelper(component,event,getInputkeyWord,SobjectName);
        }
        else{  
            component.set("v.listOfSearchRecords", null ); 
            var forclose = component.find("searchRes2");
            $A.util.addClass(forclose, 'slds-is-close');
            $A.util.removeClass(forclose, 'slds-is-open');
        }
    },
    
    keyPressController3 : function(component, event, helper) {
        var getInputkeyWord = component.get("v.SearchOppKeyWord");
        console.log('Cont Key press',getInputkeyWord);
        component.set("v.SobjectName","Contact");
        var SobjectName = component.get("v.SobjectName");
        if( SearchConKeyWord.length > 0 ){
            var forOpen = component.find("searchRes3");
            $A.util.addClass(forOpen, 'slds-is-open');
            $A.util.removeClass(forOpen, 'slds-is-close');
            helper.searchHelper(component,event,getInputkeyWord,SobjectName);
        }
        else{  
            component.set("v.listOfSearchRecords", null ); 
            var forclose = component.find("searchRes3");
            $A.util.addClass(forclose, 'slds-is-close');
            $A.util.removeClass(forclose, 'slds-is-open');
        }
    },
    
    clear2 : function(component,event,helper){
        component.set("v.hidesearchicon" , true);
        helper.clearblock(component,event,"lookup-pill","lookupField");
        component.set("v.enableCont",true);
        component.set("v.brandbtn",true);
    },
    clear : function(component,event,helper){
        component.set("v.hidesearchicon2" , true);
        helper.clearblock(component,event,"lookup-pill2","lookupField2");
    },
    clear3 : function(component,event,helper){
        component.set("v.hidesearchicon3" , true);
        helper.clearblock(component,event,"lookup-pill3","lookupField3");
        helper.emptyTheInputBlock(component,event,helper);
    }, 
    
    handleComponentEvent : function(component, event, helper) {
        
        var selectedAccountGetFromEvent = event.getParam("recordByEvent");
        var hidesearchicon = event.getParam("hidesearchicon");
        var sObjName = event.getParam("sObjName");
        var selectedRecId = event.getParam('selectedRecId');
        console.log('selectedRecId>>>>>>>>',selectedRecId);
        component.set("v.ObjforClear",sObjName);
        console.log('sObjName inside handleComponentEvent>>>>>>>>',sObjName);
        if(sObjName == "Account"){
            component.set("v.AccId",selectedRecId);
            console.log('getId>>>>>>>>',component.get("v.AccId"));
            component.set("v.AccselectedRecord" , selectedAccountGetFromEvent);
            component.set("v.hidesearchicon" , hidesearchicon);
            component.set("v.SelectAccId",selectedRecId);
            helper.pillblock(component,event,"lookup-pill","lookupField","searchRes");
            component.set("v.brandbtn",false);
        }
        
        if(sObjName == "Opportunity"){
            component.set("v.ContselectedRecord" , selectedAccountGetFromEvent); 
            component.set("v.hidesearchicon2" , hidesearchicon);
            helper.pillblock(component,event,"lookup-pill2","lookupField2","searchRes2");
        }
        
        if(sObjName == "Contact"){
            component.set("v.OpptselectedRecord" , selectedAccountGetFromEvent);
            component.set("v.Street",selectedAccountGetFromEvent.MailingStreet);
            component.set("v.City",selectedAccountGetFromEvent.MailingCity);
            component.set("v.State",selectedAccountGetFromEvent.MailingState);
            component.set("v.Country",selectedAccountGetFromEvent.MailingCountry);
            component.set("v.PostalCode",selectedAccountGetFromEvent.MailingPostalCode);
            component.set("v.hidesearchicon3" , hidesearchicon);
            component.set("v.enableCont",false);
            helper.pillblock(component,event,"lookup-pill3","lookupField3","searchRes3");
        }
        
    },
    
    createtog : function(component, event, helper) {
        var checkbox = document.getElementById('test').checked;
        component.set("v.showLookUp", !component.get('v.showLookUp'));
        component.set("v.showInput", !component.get('v.showInput'));
        
    },
    createtog2 : function(component, event, helper) {
        var checkbox = document.getElementById('test2').checked;
        component.set("v.showLookUp2", !component.get('v.showLookUp2'));
        component.set("v.showInput2", !component.get('v.showInput2'));
        
    },
    createtog3 : function(component, event, helper) {
        // var checkbox = document.getElementById('test3').checked;
        component.set("v.showLookUp3", !component.get('v.showLookUp3'));
        component.set("v.showInput3", !component.get('v.showInput3'));
        console.log('showInput3>>>>>>>>',component.get('v.showInput3'));
        if(component.get('v.showInput3')){
            component.set("v.enableCont",false);
            helper.emptyTheInputBlock(component,event,helper);
        }else{
            component.set("v.enableCont",true);
        }
    },
    
    createNewOpp: function(component, event, helper) {
        var val = component.find('checkboxLeads').get("v.value");
        if(val == true){
            component.set("v.enableOpp",false);
            
        }else{
            component.set("v.enableOpp",true);
            component.set("v.hidesearchicon2" , true);
            helper.clearblock(component,event,"lookup-pill2","lookupField2");
        }
        
    },
    
    Convertlead : function(component, event, helper){ 
        var SelectedOppt = component.get("v.ContselectedRecord").Name;
        var SelectedAcc = component.get("v.AccselectedRecord").Name;
        var SelectedCont = component.get("v.OpptselectedRecord").Name;
        var street = component.get("v.Street");
        var City = component.get("v.City");
        var State = component.get("v.State");
        var Country = component.get("v.Country");
        var PostalCode = component.get("v.PostalCode");
        console.log('SelectedOppt>>>>>>>',SelectedOppt);
        console.log('SelectedAcc>>>>>>>',SelectedAcc);
        console.log('SelectedAcc>>>>>>>',SelectedCont);
        console.log('street>>>>>>>',street);
        console.log('City>>>>>>>',City);
        console.log('State>>>>>>>',State);
        console.log('Country>>>>>>>',Country);
        console.log('PostalCode>>>>>>>',PostalCode);
        
        component.set("v.CreateObjects.OpptName",SelectedOppt);
        component.set("v.CreateObjects.AcctName",SelectedAcc);
        component.set("v.CreateObjects.ContName",SelectedCont);
        var AccId = component.get("v.AccId");
        console.log('AccId>>>>>>>>',AccId);
        var allValues = SelectedOppt +', '+ SelectedAcc +', '+ SelectedCont +', '+ street +', '+  City +', '+  State +', '+  Country +', '+ PostalCode;
        console.log('CreateObjects>>>>>>>',component.set("v.CreateObjects"));
        
        var action = component.get("c.SaveDatas");
        //set parameters send to apex
        action.setParams({allValues:allValues,
                          checkConToggle:component.get('v.enableCont'),
                          AccId:AccId
                         });
        
        $A.enqueueAction(action);
        
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": AccId,
        });
        navEvt.fire();
        
    }
    
})