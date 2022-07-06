/**
 * Created by Sergey Krivorotov.
 */

public with sharing class GenericErrorHandlerCallouts extends GenericErrorHandler{

    public override Type getType() {
        return GenericErrorHandlerCallouts.class;
    }

    public void execute(QueueableContext param1) {
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:RatesService1');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            System.debug('Response: ' + response.getBody());
            if (response.getStatus() == 'OK') status = 'Success';
            System.debug('Status:' + status);
            System.debug('Response status: ' + response.getStatus());
        } catch (Exception e) {
            System.debug('Error: ' + e.getMessage() + '. ' + e.getStackTraceString());
        }
    }

}