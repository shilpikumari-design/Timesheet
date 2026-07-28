@isTest
public class OpportunityPreventDateTest{
@isTest
static void OpportunityPreventDate() {

       
        Opportunity opp = new Opportunity(
            Name = 'Test Closed Opp',
            StageName = 'Closed Won',   
            CloseDate = Date.today(),
            Amount = 1000
        );
        insert opp;

          opp.CloseDate = Date.today().addDays(5);
       
        Boolean exceptionThrown = false;

        Test.startTest();
        try {
            update opp;  
        } catch (DmlException e) {
            exceptionThrown = true;

            
            System.assertEquals(
                true,
                e.getMessage().contains('Close Date cannot be changed'),
            'Error message should match'
            );
        }
        Test.stopTest();

        System.assertEquals(true, exceptionThrown, 'Exception should be thrown');
       
    }
}