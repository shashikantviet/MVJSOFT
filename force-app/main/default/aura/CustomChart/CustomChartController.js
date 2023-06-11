({	
	ctr : function(cmp, event, helper) {
        console.log('ctr');
        var temp = [];
        var temp2 = [];
        var action1 = cmp.get("c.getLineChartMap");
        var action = cmp.get("c.getChartMap");
        action.setCallback(this, function(response){
            console.log('ctr',response.getState());
            if(response.getState() === 'SUCCESS' && response.getReturnValue()){
                console.log('action1');
                temp = response.getReturnValue();
                helper.createGraph(cmp, temp);
            }
        });      
        action1.setCallback(this, function(response){        	    	    
            if(response.getState() === 'SUCCESS' && response.getReturnValue()){
                 console.log('action');
                temp2 = JSON.parse(response.getReturnValue());
                helper.createLineGraph(cmp, temp2);
            }            
        });  
       $A.enqueueAction(action);	
       $A.enqueueAction(action1);
	}
})