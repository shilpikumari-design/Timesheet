public class ACCOUNTRECORDSFETCH {
    public static void AccountMethod(){
    List<Account> accList = new List<Account>([select Id,Name from Account limit 5]);
        for(Account acc:accList)
        {
            if(!acclist.isEmpty())
            {
                insert accList;
            }
        }
    }
    }