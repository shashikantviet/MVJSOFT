({
    doInit : function(component, event, helper) {
        var currentDate = new Date();
        console.log('==>',currentDate);
        var day = currentDate.getDate();
        var year = currentDate.getFullYear();
        const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
                           ];
        
        const d = new Date();
        var month = monthNames[d.getMonth()];
        component.set('v.defaultDateValue',month+' '+day+', '+year);
    },
    
    dateValue : function(component, event, helper){
        var defaultValue = component.get('v.defaultDateValue');
        console.log('Test-->',defaultValue);
    },
    
    detailInformation : function(component, event, helper){
        component.set('v.isNextStep',true);
    },
    
    closeModelWindow : function(component, event, helper){
        component.set('v.isNextStep',false);
    }
})