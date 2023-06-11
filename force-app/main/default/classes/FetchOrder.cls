@RestResource(urlMapping='/v1/getOrders/*')
global with sharing class FetchOrder {
@HttpGet
    global static List<Order> FetchOrder(){
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        
        String orderNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        
        Set<String> setOfOrderNumbers = new Set<String>();
        for(String str : orderNumber.split(',')){
            setOfOrderNumbers.add(str);
        }
        System.debug('test-------->'+orderNumber);
        System.debug('test-------->'+req.requestURI);
        
        
        System.debug('>>>>req>>>>>>'+req);
        System.debug('>>>>res>>>>>>'+res);
        List<Order> ordersDetail = [SELECT Id , OrderNumber, Status 
                                	FROM Order
                                	WHERE OrderNumber IN :setOfOrderNumbers];
        return ordersDetail ;
    }
}