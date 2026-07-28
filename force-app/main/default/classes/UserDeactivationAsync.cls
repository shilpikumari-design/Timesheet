public class UserDeactivationAsync {
    @future
    public static void createLog(Id userId) {
        User u = [SELECT Name, Email FROM User WHERE Id = :userId];

        User_deactivate_c__c log = new User_deactivate_c__c(); // Use correct object name
        log.User__c = u.Id; 
        insert log;
    }
}