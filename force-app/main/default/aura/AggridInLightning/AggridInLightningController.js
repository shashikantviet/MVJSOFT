({
    doInit : function(component, event) {
        var data = [];
        alert('entered1');
        data.push({height: 20, width: 200, depth: 20});
        /*for (var i = 0; i<20; i++) {
            data.push({
                height: Math.floor(Math.random()*100),
                width: Math.floor(Math.random()*100),
                depth: Math.floor(Math.random()*100)
            });
        }*/
        var gridOptions = {
            columnDefs: [
                // colId will be 'firstCol'
                {headerName: 'Col 1', colId: 'firstCol', field: 'height'},
                // colId will be 'firstCol_1', cos 'firstCol' already taken
                {headerName: 'Col 2', colId: 'firstCol', field: 'height'},
                
                // colId will be 'height'
                {headerName: 'Col 3', field: 'height'},
                // colId will be 'height_1', cos 'height' already taken
                {headerName: 'Col 4', field: 'height'},
                
                // no colId, no field, so grid generated ID
                {headerName: 'Col 5', valueGetter: 'data.width'},
                {headerName: 'Col 6', valueGetter: 'data.width'}
            ],
            rowData: data,
            onGridReady: function(params) {
                var cols = params.columnApi.getAllColumns();
                //cols.forEach(function(col) {
                  //  var colDef = col.getUserProvidedColDef();
                    //console.log(colDef.headerName + ', Column ID = ' + col.getId(), colDef);
                //});
            }
        };
        console.log('>>>>>data>>>>',data);
        console.log('>>>>>>gridOptions>>>',gridOptions);
        alert(data);
        // setup the grid after the page has finished loading
        // Function to add event listener to table
        
    }
       /* var cmp = component.find("myGrid");
        cmp.forEach(function(item){
            item.getElement().addEventListener("DOMContentLoaded", function(){
                console.log('>>>>inside>>>>>');
                var gridDiv = document.querySelector('#myGrid');
                console.log('>>>>gridDiv>>>>>',gridDiv);
                new agGrid.Grid(gridDiv, gridOptions);
            });
        });
        /*var el = document.getElementById("myGrid");
        el.addEventListener('DOMContentLoaded', function(event) {
        console.log('>>>>inside>>>>>');
        var gridDiv = document.querySelector('#myGrid');
        console.log('>>>>gridDiv>>>>>',gridDiv);
        new agGrid.Grid(gridDiv, gridOptions);
        });*/
        
        
        /*var action = component.get("c.getAccountRecord");
        action.setCallback(this, function(a) {
            component.set("v.retValues", a.getReturnValue());
        });
        $A.enqueueAction(action);*/
    /*},
    
    loadRecords : function(component, event){
        
        
    }*/
})