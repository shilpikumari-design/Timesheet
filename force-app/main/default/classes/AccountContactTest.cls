@IsTest
public class AccountContactTest {
 @IsTest
 static void testCreateContact() {

        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Test.startTest();
        AccountContactService.createContact(acc.Id);
        Test.stopTest();

        Contact con = [
            SELECT Id, LastName, AccountId
            FROM Contact
            WHERE AccountId = :acc.Id
            LIMIT 1
        ];

        System.assertEquals('Test Account', con.LastName);
        System.assertEquals(acc.Id, con.AccountId);
    }
}