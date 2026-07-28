public class AccountContactService {
   public static void createContact(Id accountId) {

        Account acc = [
            SELECT Id, Name
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];

        Contact con = new Contact();
        con.LastName = acc.Name;
        con.AccountId = acc.Id;

        insert con;
    }
}