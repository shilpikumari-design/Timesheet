@isTest
public class OpportunityToAccountTest {
     @isTest
    static void testHighValueTask() {

        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'High Value Deal',
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(10),
            Amount = 150000,
            AccountId = acc.Id
        );

        Test.startTest();
        insert opp;
        Test.stopTest();

        Task t = [
            SELECT OwnerId, WhatId, Subject
            FROM Task
            WHERE WhatId = :opp.Id
            LIMIT 1
        ];

        System.assertEquals(acc.OwnerId, t.OwnerId);
        System.assertEquals('Follow up on High Value Opportunity', t.Subject);
    }
}