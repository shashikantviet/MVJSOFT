({
    searchHelper : function(component,event,getInputkeyWord,SObjectName,SelectedAccId) {
        console.log('component>>', getInputkeyWord);
        // call the apex class method 
        var action = component.get("c.fetchLookUpValues");
        action.setParams({
            'searchKeyWord' : getInputkeyWord,
            'ObjectName' : SObjectName,
            'SelectedAccId' : SelectedAccId
        });
        // set a callBack    
        action.setCallback(this, function(response) {
            $A.util.removeClass(component.find("mySpinner"), "slds-show");
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                // if storeResponse size is equal 0 ,display No Result Found... message on screen.                }
                if (storeResponse.length == 0) {
                    component.set("v.Message", 'No Result Found...');
                } else {
                    component.set("v.Message", '');
                }
                // set searchResult list with return value from server.
                component.set("v.listOfSearchRecords", storeResponse);
                component.set("v.Street",storeResponse.MailingStreet);
                component.set("v.City",storeResponse.MailingCity);
                component.set("v.State",storeResponse.MailingState);
                component.set("v.Country",storeResponse.MailingCountry);
                component.set("v.PostalCode",storeResponse.MailingPostalCode);
            }
            
        });
        // enqueue the Action  
        $A.enqueueAction(action);
        
    },
    
    pillblock : function(component,event,pill,field,searchid) {
        
        var forclose = component.find(pill);
        $A.util.addClass(forclose, 'slds-show');
        $A.util.removeClass(forclose, 'slds-hide');
        
        var forclose = component.find(searchid);
        $A.util.addClass(forclose, 'slds-is-close');
        $A.util.removeClass(forclose, 'slds-is-open');
        
        var lookUpTarget = component.find(field);
        $A.util.addClass(lookUpTarget, 'slds-hide');
        $A.util.removeClass(lookUpTarget, 'slds-show'); 
        
    },
    
    clearblock : function(component,event,pill,field) {
        
        var pillTarget = component.find(pill);
        var lookUpTarget = component.find(field); 
        
        $A.util.addClass(pillTarget, 'slds-hide');
        $A.util.removeClass(pillTarget, 'slds-show');
        
        $A.util.addClass(lookUpTarget, 'slds-show');
        $A.util.removeClass(lookUpTarget, 'slds-hide');
        
        component.set("v.SearchKeyWord",null);
        component.set("v.SearchConKeyWord",null);
        component.set("v.SearchOppKeyWord",null);
        component.set("v.listOfSearchRecords", null );
        component.set("v.selectedRecord", {} ); 
    },
    emptyTheInputBlock :function(component,event,pill,field) {
    document.getElementById('textareaBox1').value = '';
    document.getElementById('textareaBox2').value = '';
    document.getElementById('textBox1').value = '';
    document.getElementById('textBox2').value = '';
    document.getElementById('textBox3').value = '';
}
})