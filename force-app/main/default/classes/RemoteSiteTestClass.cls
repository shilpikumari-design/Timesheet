public class RemoteSiteTestClass {
    
    public static void AnimalAPImethod() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        
        Http http = new Http();
        HttpResponse res = http.send(request);
        
        if(res.getStatusCode() == 200) {
            System.debug('Response Body: ' + res.getBody());
        }
    }
}