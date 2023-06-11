public with sharing class Spoonacular {
    private static final String spoonacular_Api='https://api.spoonacular.com';
    private static final String api_Key='f975ca7a45d442bea312f6b26dc9a027';
    @AuraEnabled
    public static void getRandomReceipe() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(spoonacular_Api+'/recipes/random?apiKey='+api_Key);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        System.debug('response getStatusCode--'+response.getStatusCode());
        if(response.getStatusCode() == 200) {
            System.debug('response --'+response.getBody());
        }
    }
    @AuraEnabled
    public static String getReceipe(String receipeId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(spoonacular_Api+'/recipes/'+receipeId+'/information?apiKey='+api_Key);
      //  https://api.spoonacular.com/recipes/{id}/information
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        System.debug('response getStatusCode--'+response.getStatusCode());
        if(response.getStatusCode() == 200) {
           return response.getBody();
        }
        return '';
    }
    @AuraEnabled
      public static String getReceipeByIngredients(String ingredients) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(spoonacular_Api+'/recipes/findByIngredients?apiKey='+api_Key+'&ingredients='+ingredients);
          //https://api.spoonacular.com/recipes/findByIngredients
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        System.debug('response getStatusCode--'+response.getStatusCode());
        if(response.getStatusCode() == 200) {
            return response.getBody();
        }
        return '';
    }
}