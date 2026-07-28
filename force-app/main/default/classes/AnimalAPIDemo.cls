public class AnimalAPIDemo {
    @future(callout=true)
    public static void AnimalAIMethod() {
        try {
            HttpRequest req = new HttpRequest();
            req.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
            req.setMethod('GET');

            Http http = new Http();
            HttpResponse res = http.send(req);

            System.debug('GET Response: ' + res.getBody());
        } catch(Exception e) {
            System.debug('Error in Future GET callout: ' + e.getMessage());
        }
    }
}