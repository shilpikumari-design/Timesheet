public class BatchClassEx implements Database.Batchable<sObject> , Schedulable {
    public void execute (schedulableContext ctx){
        BatchClassEx be=new BatchClassEx();
        Database.executebatch(be);
    }
    //================batch======================//
    public Database.QueryLocator start(Database.BatchableContext bc){
        string query='select id,First_Name__c from client__c';
        return database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc , List<client__c> csList ){
        for(client__c c:csList){
            c.First_Name__c=c.First_Name__c+'batch';
        }
        update csList;
    }
    public void finish( Database.BatchableContext bc){
        
    } 
    }