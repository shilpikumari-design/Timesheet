public with sharing class AccountConsoleController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {

        return [
            SELECT Id,
                   Name,
                   Industries__c
            FROM Account
           
        ];
    }

    @AuraEnabled
    public static void updateIndustries(Id accId, String industries) {

        Account acc = new Account(
            Id = accId,
            Industries__c = industries
        );

        update acc;
    }
}