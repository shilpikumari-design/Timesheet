public class UpdateValidationHelper {
    public static void updateValidationHandler(List<client__c>csListNew){
        for(client__c c:csListNew){
    list<client__c>csList=[select id from client__c where First_Name__c =:c.First_Name__c and Last_Name__c=:c.Last_Name__c
                          and Recent_City__c=:c.Recent_City__c  and Count_Of_Address__c=:c.Count_Of_Address__c];
    if(csList.size()>0){
        c.addError('duplicate Name found');
    }
}
}
}