({
    getStartLocation : function(component, event, helper) {
        /*console.log('>>Inside>>');
        if (navigator.geolocation) {
            
            navigator.geolocation.getCurrentPosition(function(p){
                console.log('>>latitude>>>',p.coords.latitude);
                console.log('>>longitude>>>',p.coords.longitude);
            });
            
        } else {
            console.log("Geolocation is not supported by this browser.");
        }*/
        if(navigator.geoLocation){
            console.log("capability is there");
        }else{
            console.log("No Capability");
        }
        navigator.geolocation.getCurrentPosition(function(position) {
            var latit = position.coords.latitude;
            console.log("latit>>>",latit);
            var longit = position.coords.longitude;
            console.log("longit>>>",longit);
            component.set("v.latitude",latit);
            component.set("v.longitude",longit);
            
            
        });
        
    },
    getEndLocation :  function(component, event, helper) {
        
    }
})