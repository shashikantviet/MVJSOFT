({
    loadContacts : function(component) {
        var detail = component.get("c.TransactionRec");
        detail.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var data = response.getReturnValue();
                component.set("v.transactionDeatil", data.lstTrans);
                component.set("v.filterDatas", data.lstTrans);
                console.log('data.lstTrans==>',data.lstTrans);
                component.set("v.lstOfWrap", data.lstOfWrap);
                console.log('data.lstOfWrap==>',data.lstOfWrap);
            }
        });
        $A.enqueueAction(detail);
    },
    
    sortBy: function(component, field) {
        console.log('===>',field);
        var sortAsc = component.get("v.sortAsc"),
            sortField = component.get("v.sortField"),
            records = component.get("v.transactionDeatil");
        sortAsc = field == sortField? !sortAsc: true;
        records.sort(function(a,b){
            var t1 = a[field] == b[field],
                t2 = a[field] > b[field];
            return t1? 0: (sortAsc?-1:1)*(t2?-1:1);
        });
        
        component.set("v.transactionDeatil", records);
    },
    getpicklistValue : function(component) {
        var Action = component.get("c.getPickListValuesIntoList");
        Action.setCallback(this,function(response){
            component.set('v.pickLIst',response.getReturnValue());
        });
        $A.enqueueAction(Action);
        
    }
})