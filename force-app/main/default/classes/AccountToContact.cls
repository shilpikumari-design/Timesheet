public class AccountToContact {
    public void contactCountMethod(){
             List<Account> acclist = [SELECT Id, Name, (SELECT Id FROM Contacts) FROM Account] ;
        for(Account acc: acclist){
            integer countContact=acc.contacts.size();
                if (countcontact>0){
                System.debug('Account Name: ' + acc.Name + ', Contact Count: ' + countContact);
        }
        }
    }
}