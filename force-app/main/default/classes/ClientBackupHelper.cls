public class ClientBackupHelper {
    public static void backupHandler(list<client__c>csList){
       
list<client_backup__c>bkList=new list<client_backup__c>();
    for(client__c c:csList){
        client_backup__c bk=new client_backup__c();
        bk.First_Name__c=c.First_Name__c;
         bk.Last_Name__c=c.Last_Name__c;      //client-no.of records-list 
        bkList.add(bk);
    }
    insert bkList;
}
}