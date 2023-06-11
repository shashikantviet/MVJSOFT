({
      addListeners : function (component){
      var cmp = component.find("myGrid");
          alert(cmp+'---------');
      /*cmp.forEach(function(item){
    
          item.getElement().addEventListener("DOMContentLoaded", function(){
                console.log('>>>>inside>>>>>');
                var gridDiv = document.querySelector('#myGrid');
                console.log('>>>>gridDiv>>>>>',gridDiv);
                new agGrid.Grid(gridDiv, gridOptions);
            });
      });  */
          var fruits = ["apple", "orange", "cherry"];

          	//cmp.forEachNode(myFunction);
			alert(cmp+'&&&&&&&');
            function myFunction(item, index) 
          	{
                alert(index + "::::::::::::" + item); 
                item.getElement().addEventListener("DOMContentLoaded", function(){
                    console.log('>>>>inside>>>>>');
                    var gridDiv = document.querySelector('#myGrid');
                    console.log('>>>>gridDiv>>>>>',gridDiv);
                    new agGrid.Grid(gridDiv, gridOptions);
            	});
            }
          
    }
	
})