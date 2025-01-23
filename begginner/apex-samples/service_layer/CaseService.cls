// Service Class
public with sharing class CaseService {
    public static void closeCases(List<Id> caseIds, String closeReason) {
        List<Case> casesToUpdate = [
            SELECT Id, Status, Reason 
            FROM Case 
            WHERE Id IN :caseIds AND Status != 'Closed'
        ];
        
        for (Case c : casesToUpdate) {
            c.Status = 'Closed';
            c.Reason = closeReason;
        }
        
        if (!casesToUpdate.isEmpty()) {
            update casesToUpdate;
        }
    }
}
