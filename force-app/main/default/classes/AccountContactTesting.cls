@isTest
    public class AccountContactTesting {
    @isTest
    static void testContactCreatedForStandardUser() {
        Profile p = [
            SELECT Id 
            FROM Profile 
            WHERE Name = 'Standard User' 
            LIMIT 1
        ];

      
        User u = new User(
            Alias = 'stdusr',
            Email = 'stduser@test.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'User',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'Asia/Kolkata',
            ProfileId = p.Id,
            UserName = 'stduser' + System.currentTimeMillis() + '@test.com'
        );

        insert u;

        System.runAs(u) {

            Account acc = new Account(
                Name = 'Test Account',
                Contact_checkbox__c = true
            );

            Test.startTest();
            insert acc;
            Test.stopTest();

            List<Contact> conList = [
                SELECT Id, AccountId
                FROM Contact
                WHERE AccountId = :acc.Id
            ];

            System.assertEquals(
                1,
                conList.size(),
                'Contact should be created when checkbox is true'
            );
        }
    }
}