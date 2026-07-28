public class TimeSheetApprovalController {

    @AuraEnabled
    public static String submitForApproval(Id recordId) {

        try {

            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
            req.setObjectId(recordId);
            req.setSubmitterId(UserInfo.getUserId());
            req.setComments('Submitted from LWC');

            Approval.ProcessResult result = Approval.process(req);

            if (result.isSuccess()) {
                return 'Success';
            }

            return 'Failed';

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}