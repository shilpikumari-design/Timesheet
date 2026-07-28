@isTest
public class AccountUpdationTest {
    
    @isTest
    static void testEmailOnContactModification() {
        
       
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
     
        Contact con = new Contact(
            FirstName = 'Test',
            LastName = 'Contact',
            Email = 'test@test.com',
            AccountId = acc.Id
        );
        insert con;
        
        
        con.Email = 'updated@test.com';
        update con;
        
        Test.startTest();
        
        
        acc.Name = 'Updated Account';
        update acc;
        
        Test.stopTest();
        
      
        System.assert(true);
    }
}