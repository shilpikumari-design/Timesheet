public with sharing class TimeSheetComponent {

    @AuraEnabled(cacheable=true)
    public static List<Timesheet__c> getTimeSheet(String month, String year) {

        return [
            SELECT Id, Name, Months__c, Year__c,
                   Week_EndDate__c, Week_StartDate__c,
                   Sheet_Number__c, Status__c
            FROM Timesheet__c
            WHERE Months__c = :month
            AND Year__c = :year
        ];
    }

    @AuraEnabled
    public static void saveTimecard(
        String taskName,
        String status,
        Decimal hours,
        String userStory,
        String selectedDate
    ) {
        try {

            if (String.isBlank(selectedDate)) {
                throw new AuraHandledException('Selected Date is required');
            }

            Date parsedDate = Date.valueOf(selectedDate);

            Timecard__c tc = new Timecard__c();
            tc.Name = 'TC-' + String.valueOf(System.now().getTime());
            tc.TaskName__c = taskName;
            tc.Status__c = status;
            tc.Hours__c = hours;
            tc.User_Story__c = userStory;
            tc.Date__c = parsedDate;

            insert tc;

        } catch (Exception e) {
            throw new AuraHandledException('Error saving timecard: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Timecard__c> getRecentTimecards() {

        return [
            SELECT Id, Name, Date__c, TaskName__c, Status__c, Hours__c, User_Story__c
            FROM Timecard__c
            ORDER BY CreatedDate DESC
            LIMIT 10
        ];
    }
}