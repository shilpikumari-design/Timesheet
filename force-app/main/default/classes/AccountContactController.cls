public class AccountContactController {
    public class AccountWrapper {
        public Account account { get; set; }
        public List<Contact> contacts { get; set; }

        public AccountWrapper(Account account, List<Contact> contacts) {
            this.account = account;
            this.contacts = contacts;
        }
    }

    public List<AccountWrapper> accountWrapperList { get; set; }

    public AccountContactController() {
        accountWrapperList = new List<AccountWrapper>();
        // Query Accounts with their related Contacts
        List<Account> accounts = [
            SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts)
            FROM Account
            LIMIT 5
        ];

        // Populate the wrapper list
        for (Account acc : accounts) {
           // accountWrapperList.add(new AccountWrapper(acc, acc.Contacts));
        }
    }
}