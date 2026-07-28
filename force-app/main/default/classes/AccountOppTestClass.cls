@istest
public class AccountOppTestClass {

    @isTest
    static void testOpportunityUpdate() {

        
        Account acc = new Account(
            Name = 'Test Account',
            Active__c = 'Yes'
        );
        insert acc;

      
        Opportunity opp1 = new Opportunity(
            Name = 'Opp 1',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            AccountId = acc.Id
        );

        Opportunity opp2 = new Opportunity(
            Name = 'Opp 2',
            StageName = 'Closed Won',
            CloseDate = Date.today(),
            AccountId = acc.Id
        );

        insert new List<Opportunity>{opp1, opp2};

       
        acc.Active__c = 'No';

        Test.startTest();
        update acc;
        Test.stopTest();

      
        List<Opportunity> oppList = [
            SELECT StageName
            FROM Opportunity
            WHERE AccountId = :acc.Id
        ];

        for(Opportunity opp : oppList){
            if(opp.Name == 'Opp 1'){
                System.assertEquals('Closed Lost', opp.StageName);
            }
            if(opp.Name == 'Opp 2'){
                System.assertEquals('Closed Won', opp.StageName);
            }
        }
    }
}