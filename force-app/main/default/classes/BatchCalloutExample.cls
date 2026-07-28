global class BatchCalloutExample implements Database.Batchable<SObject>, Database.AllowsCallouts {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Name FROM Account LIMIT 10');
    }

    global void execute(Database.BatchableContext bc, List<Account> scope) {
        for(Account acc : scope){
            HttpRequest req = new HttpRequest();          
            req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
            req.setMethod('GET');

            Http http = new Http();
            HttpResponse res = http.send(req);
            System.debug('Response for ' + acc.Name + ': ' + res.getBody());
        }
    }

    global void finish(Database.BatchableContext bc) {
        System.debug('All callouts completed.');
        
    }
}