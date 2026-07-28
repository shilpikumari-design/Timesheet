public class AccountWrappers {
    public Account acc { get; set; }
    public List<Contact> relatedContacts { get; set; }

    // Constructor to initialize with account and related contacts
    public AccountWrappers(Account account, List<Contact> contacts) {
        this.acc = account;
        this.relatedContacts = contacts;
    }


public class MyClass {
    public List<AccountWrappers> accountWrappers { get; set; }

    public MyClass() {
        accountWrappers = new List<AccountWrappers>();

        // Query to fetch accounts and their related contacts
        List<Account> accounts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account LIMIT 10];

        // Populate the wrapper list
        for (Account acc : accounts) {
            accountWrappers.add(new AccountWrappers(acc, acc.Contacts != null ? (List<Contact>)acc.Contacts : new List<Contact>()));
        }
    }
}

}