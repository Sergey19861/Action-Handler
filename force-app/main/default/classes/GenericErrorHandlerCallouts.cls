/**
 * Created by Sergey Krivorotov.
 */

public with sharing class GenericErrorHandlerCallouts extends GenericErrorHandler{

    public GenericErrorHandlerCallouts(Integer attempts, Integer interval) {
        super(attempts, interval);
    }

    public void execute(SchedulableContext sc) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://test.com');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatus() == 'OK') status = 'Success';
    }

    public override Type getType() {
        return GenericErrorHandlerCallouts.class;
    }
}