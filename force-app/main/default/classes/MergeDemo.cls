public class MergeDemo
{
    public void MergeDemoMethod()
    {
       // List<string>strList=new List<string>();
        //List<client__c> Merge1=new List<client__c>([Select 	First_Name__c, Last_Name__c FROM client__c where  First_Name__c like 'shilpi %']);
        //list<client__c> Merge2=[select 	First_Name__c,Last_Name__c from client__c where  Last_Name__c='kumari'];
         //Merge1.addAll(Merge2);
          // system.debug('mergevalue =>'+ StrList);
          
   
    
        // List to store merged client records
        List<client__c> Merge1 = [SELECT First_Name__c, Last_Name__c FROM client__c WHERE First_Name__c LIKE 'shilpi %'];
        List<client__c> Merge2 = [SELECT First_Name__c, Last_Name__c FROM client__c WHERE Last_Name__c = 'kumari'];
        
        // Merge both lists
        Merge1.addAll(Merge2);
        System.debug('Merged Client List: ' + Merge1);
    }
}