public class AccountUpdateToNEw {
    public Static void AccountUpdateMethod()
    {
        List<Account>acclist=new List<Account>([select Id,Name,Rating,AnnualRevenue from Account]);
        for(Account acc:acclist){
            if(acc.AnnualRevenue==1000000)
            {
                acc.Rating='Hot';
                
            }
            if(!acclist.isEmpty())
            {
                update acclist;
            }
        }
        
    }

}