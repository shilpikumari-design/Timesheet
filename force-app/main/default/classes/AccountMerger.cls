public class AccountMerger {

    public static void mergeDuplicateAccounts() {
        
        List<Account> allAccounts = [SELECT Id, Name, Phone, Industry FROM Account WHERE Name = 'Shilpi'];

       
        Account masterAccount = allAccounts[0];//common account where we will add all other accounts.

  
        for (Integer i = 1; i < allAccounts.size(); i++) {
            Account duplicate = allAccounts[i];

           
            if (String.isBlank(masterAccount.Phone)) {
                masterAccount.Phone = duplicate.Phone;
            }
            if (String.isBlank(masterAccount.Industry)) {
                masterAccount.Industry = duplicate.Industry;
            }
        }

        
        update masterAccount; 
        System.debug('Master Account ID: ' + masterAccount.Id);
        System.debug('Duplicates are NOT deleted.');
    }
}