/**
 * Created by Sergey Krivorotov.
 */

public abstract with sharing class GenericErrorHandler implements Queueable, Database.AllowsCallouts {

    public String status = '';

    public abstract Type getType();

    public String getStatus() {
        System.debug('Status inside handler: ' + status);
        return status;
    }

}