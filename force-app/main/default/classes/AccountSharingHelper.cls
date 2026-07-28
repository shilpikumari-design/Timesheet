public class AccountSharingHelper {
    public static void AccountSharing(Id accountId , Id userId)
    {
        AccountShare accshare =new AccountShare();
        accshare.AccountId=accountId;
        accshare.UserOrGroupId=userId;
        accshare.AccountAccessLevel='Read';
        accShare.OpportunityAccessLevel = 'Read';
        accshare.Rowcause= schema.AccountShare.Rowcause.manual;
        
   
insert accshare;

    }
}