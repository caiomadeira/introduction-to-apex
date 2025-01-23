@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {
    global class CloseCaseRequest {
        public String reason;
    }

    @HttpPost
    global static void closeCase() {
        RestRequest req = RestContext.request;
        String caseId = req.requestURI.substringBetween('/case/', '/close');
        
        CloseCaseRequest requestBody;
        try {
            requestBody = (CloseCaseRequest)JSON.deserialize(req.requestBody.toString(), CloseCaseRequest.class);
        } catch (Exception e) {
            RestContext.response.statusCode = 400;
            RestContext.response.responseBody = Blob.valueOf('Invalid request body');
            return;
        }
        
        if (String.isBlank(caseId) || String.isBlank(requestBody.reason)) {
            RestContext.response.statusCode = 400;
            RestContext.response.responseBody = Blob.valueOf('Case ID and reason are required');
            return;
        }
        
        try {
            List<Id> caseIds = new List<Id>{Id.valueOf(caseId)};
            CaseService.closeCases(caseIds, requestBody.reason);
            RestContext.response.statusCode = 200;
            RestContext.response.responseBody = Blob.valueOf('Case closed successfully');
        } catch (Exception e) {
            RestContext.response.statusCode = 500;
            RestContext.response.responseBody = Blob.valueOf('Error closing case: ' + e.getMessage());
        }
    }
}
