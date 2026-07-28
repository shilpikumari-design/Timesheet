public class QueueCalloutClass  implements Queueable, Database.AllowsCallouts  {
 private Id accId;

    public QueueCalloutClass(Id accountId){
        this.accId = accountId;
    }

    public void execute(QueueableContext qc){
      
        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accId LIMIT 1];

        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');

        Http http = new Http();
        HttpResponse res = http.send(req);

        if(res.getStatusCode() == 200){
            System.debug('API Response for Account ' + acc.Name + ': ' + res.getBody());
        } else {
            System.debug('Failed with status code: ' + res.getStatusCode());
        }
    }
}