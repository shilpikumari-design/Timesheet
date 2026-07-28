public class NameValidationHelper {
    Public static void TestNameValidationHandler(list<client__c>csList){
        for(client__c c:csList){
            if(c.First_Name__c=='test'){
                c.First_Name__c.addError('test is not valid name');
            }
        }
    }
       Public static void duplicateName(list<client__c>csListNew){
        for(client__c c:csListNew){
    list<client__c>cslist=[select id from client__c where First_Name__c =:c.First_Name__c and Last_Name__c=:c.Last_Name__c];
    if(cslist.size()>0){
        c.Phone_number__c.addError('duplicate Name found');
    }
}
}
   Public static void duplicateContact(list<client__c>csListNew){
        for(client__c c:csListNew){
    list<client__c>cslist=[select id from client__c where Phone_number__c=:c.Phone_number__c]; 
    if(cslist.size()>0){
        c.Phone_number__c.addError('duplicate Contact found');
    } 
        }
   }
        }