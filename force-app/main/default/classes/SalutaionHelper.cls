public class SalutaionHelper {
    public static client__c salutaionHandler(client__c c){
        if(c.Gender__c=='female'){
            c.First_Name__c='Ms'+c.First_Name__c;
        }
        else if(c.Gender__c=='male'){
            c.First_Name__c='Mr'+c.First_Name__c;
        }
         else if( c.Gender__c=='other'){
            c.First_Name__c='Or'+c.First_Name__c;
         }
return c;
    }
}