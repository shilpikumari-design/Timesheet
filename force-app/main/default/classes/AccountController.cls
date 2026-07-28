public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [select Id,Name,Industry,Type from Account];
       
    }

    @AuraEnabled
    public static Id createAccount(String accountName, String industry, String type) {
        Account acc = new Account();
        acc.Name = accountName;
        acc.Industry = industry;
        acc.Type = type;
        insert acc;
        return acc.Id;
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String searchKey) {
        return [SELECT Id, Name, Industry, Type FROM Account WHERE Name LIKE :('%'+searchKey +'%')];
    }
    }