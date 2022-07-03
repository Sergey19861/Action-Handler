/**
 * Created by Sergey Krivorotov.
 */

public with sharing class GenericErrorHandlerCallouts extends GenericErrorHandler implements Database.AllowsCallouts{

    public void execute(QueueableContext qc) {
//        Http http = new Http();
//        HttpRequest request = new HttpRequest();
//        request.setEndpoint('https://test.com');
//        request.setMethod('GET');
//        HttpResponse response = http.send(request);
//        System.debug('Status:' + response.getStatus());
//        if (response.getStatus() == 'OK') status = 'Success';
        System.debug('WORK WORK WORK');
    }

    public override Type getType() {
        return GenericErrorHandlerCallouts.class;
    }

    public override String getStatus() {
        return status;
    }

}