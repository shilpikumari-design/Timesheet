Global class BatchApexSecond implements Database.Batchable<SObject>, Database.Stateful {

    global List<String> emailList = new List<String>();

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, First_Name__c, Age__c, Email__c From Client__c WHERE Age__c > 18'
        );
    }

    global void execute(Database.BatchableContext bc, List<Client__c> scope) {
        List<Client__c> clist = new List<Client__c>();

        for(Client__c ct : scope){
            if(ct.Age__c != null){
                ct.First_Name__c = ct.First_Name__c + ' - Updated';
                clist.add(ct);

                if(String.isNotBlank(ct.Email__c)){
                    emailList.add(ct.Email__c.trim());
                }
            }
        }

        if(!clist.isEmpty()){
            update clist;
        }
    }

    global void finish(Database.BatchableContext bc) {
        if(!emailList.isEmpty()){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(emailList);
            mail.setSubject('Hospital Update');
            mail.setPlainTextBody('Hello, your records have been updated successfully as an Senior Doctors and alloted to operation.');
            mail.setSaveAsActivity(false);

            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mail});
            System.debug(' Email sent to: ' + emailList);
            
        }
    }
}