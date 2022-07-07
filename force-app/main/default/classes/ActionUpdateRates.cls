/**
 * Created by Sergey Krivorotov.
 *
 *Demo class. Designed to demonstrate Action logic.
 */

public with sharing class ActionUpdateRates extends Action {

    public override Type getType() {
        return ActionUpdateRates.class;
    }

    public override void execute() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:RatesService1');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatus() != 'OK') throw new ActionException('Response status don\'t equals \'OK\'');
    }

}