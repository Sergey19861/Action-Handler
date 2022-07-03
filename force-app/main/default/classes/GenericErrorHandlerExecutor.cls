/**
 * Created by Sergey Krivorotov.
 */

public with sharing class GenericErrorHandlerExecutor {

    public static void execute(GenericErrorHandler errorHandler) {
        ErrorHandlerSettings__c settings = ErrorHandlerSettings__c.getValues(errorHandler.getType().getName());
        errorHandler.setInterval(settings.Interval__c.intValue());
        if (errorHandler.getStatus() != 'Success' && errorHandler.attempts < settings.Attempts__c.intValue()) {
            System.debug('Status: ' + errorHandler.getStatus());
            System.debug('Attempts: ' + errorHandler.attempts);
            errorHandler.attempts++;
//            errorHandler.execute();
            errorHandler.schedule();
        }
    }
}