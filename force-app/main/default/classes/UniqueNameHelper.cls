public class UniqueNameHelper {
    Public static void uniquenameHandler(list<client__c>csList){
        for(client__c c:csList){
            list<client__c>csListNew=[select id from client__c where First_Name__c=:c.First_Name__c and
                                      Last_Name__c=:c.Last_Name__c];
            if(csListNew.size()==1){
                c.addError('unique Name Found');
            }
        }
    }
}