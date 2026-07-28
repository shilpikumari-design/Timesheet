public class PickListValuesFetch {
    public   static void PickListValuesMethod()
    { 
       Schema.DescribeFieldResult fieldDescribe=Client__c.Gender__c.getDescribe();
     list< Schema.PicklistEntry> PicklistValues= fieldDescribe.getPicklistValues();
        for(PicklistEntry Entry:PicklistValues){
            system.debug('PickListlabel:'+Entry.getlabel());
           system.debug('PickListvalue:'+Entry.getvalue());
        }
    }
    
}