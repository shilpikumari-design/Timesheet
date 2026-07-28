public class RecordCustomTabs {
    public  static void CustomTabsMethod()
    {
        Map<string,Schema.SobjectType> ObjMap= Schema.getglobalDescribe();
        for(String TabsName:ObjMap.Keyset())
        {
              if (TabsName.endsWith('__c')) {
                System.debug('Custom Tab Name: ' + TabsName);
            }
        
        }
    }
}