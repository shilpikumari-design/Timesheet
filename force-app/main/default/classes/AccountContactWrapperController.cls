public class AccountContactWrapperController {

    // Public list to store the wrapper objects
    public List<AccountContactWrapper> wrapperList { get; set; }

    // Constructor that initializes the wrapper list
    public AccountContactWrapperController() {
        wrapperList = new List<AccountContactWrapper>();
        
        // Fetching a limited number of accounts from Salesforce
        List<Account> accounts = [SELECT Id, Name FROM Account LIMIT 5];

        // Loop through each account and fetch its related contacts
        for (Account acc : accounts) {
            List<Contact> contacts = [SELECT Id, Name, Email FROM Contact WHERE AccountId = :acc.Id];

            // Create a new wrapper object and add it to the list
            wrapperList.add(new AccountContactWrapper(acc, contacts));
        }
    }

    // Wrapper class to hold Account and related Contact details
    public class AccountContactWrapper {
        public Account acc { get; set; } // Stores Account object
        public List<Contact> contacts { get; set; } // Stores related Contacts

        // Constructor for the wrapper class
        public AccountContactWrapper(Account a, List<Contact> c) {
            this.acc = a;
            this.contacts = c;
        }
    }
}