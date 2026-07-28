@IsTest
public class AccountOpportunityTest {
 
   @IsTest
static void testDeleteprevent() {

    Account acc = new Account(Name = 'Acc With Open Opp');
    insert acc;

    insert new Opportunity(
        Name = 'Open Opp',
        StageName = 'Prospecting',
        CloseDate = System.today(),
        AccountId = acc.Id
    );

    try {
        delete acc;   
        System.assert(false, 'Delete should NOT succeed');
    } catch (DmlException e) {
        System.assert(e.getMessage().contains('Account cannot be deleted'));
    }
}
}