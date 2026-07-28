public class AccountControllers {
    public List<AccountWrappers> accountWrappers {get; set;  } 
    public AccountControllers() { 
        accountWrappers = new List<AccountWrappers>();
        List<Account> accounts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account LIMIT 10]; 
        for (Account acc : accounts) {
            accountWrappers.add(new AccountWrappers(acc, acc.Contacts != null ? (List<Contact>)acc.Contacts : new List<Contact>())); 
            system.debug('my data ::'+accountWrappers);
        } 
    } 
    public class AccountWrappers {
        public Account acc { get; set;}
        public List<Contact> relatedContacts { get; set; }
        public AccountWrappers(Account account, List<Contact> contacts) {
            this.acc = account;
            this.relatedContacts = contacts;
        }
    } 
}