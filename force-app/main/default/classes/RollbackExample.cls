global class RollbackExample implements Database.Batchable<sObject> {
    
   

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, FirstName, LastName FROM Contact LIMIT 2');
    }

    global void execute(Database.BatchableContext bc, List<Contact> scope) {
        Savepoint sp = Database.setSavepoint(); 
        try {
            for (Contact con : scope) {
                con.LastName = con.LastName + ' - Updated';
            }
            update scope;

            
            if (true) {
                throw new DmlException('Something went wrong!');
            }

        } catch (Exception e) {
            Database.rollback(sp); 
            System.debug('Rolled back due to error: ' + e.getMessage());
        }
    }

    global void finish(Database.BatchableContext bc) {
        System.debug('Batch Finished');
    }
}