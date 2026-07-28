@isTest
public class CasetoContactTest{
@isTest
    static void testPreventSecondOpenCase() {

        
        Contact con = new Contact(
            LastName = 'Test Contact'
        );
        insert con;

       
        Case c1 = new Case(
            ContactId = con.Id,
            Status = 'New',
            Origin = 'Phone'
        );
        insert c1;

        
        Case c2 = new Case(
            ContactId = con.Id,
            Status = 'Working',
            Origin = 'Email'
        );

        Test.startTest();
        try {
            insert c2;
            System.assert(false, 'Exception should have been thrown');
        } catch (DmlException e) {
            System.assert(
                e.getMessage().contains('Only one open case is allowed'),
                'Correct validation message'
            );
        }
        Test.stopTest();
    }

    @isTest
    static void testAllowCaseAfterClosingOldOne() {

        Contact con = new Contact(LastName = 'Closed Case Test');
        insert con;

   
        Case closedCase = new Case(
            ContactId = con.Id,
            Status = 'Closed',
            Origin = 'Phone'
        );
        insert closedCase;

       
        Case newCase = new Case(
            ContactId = con.Id,
            Status = 'New',
            Origin = 'Email'
        );

        Test.startTest();
        insert newCase;
        Test.stopTest();

        System.assertNotEquals(null, newCase.Id);
    }
}