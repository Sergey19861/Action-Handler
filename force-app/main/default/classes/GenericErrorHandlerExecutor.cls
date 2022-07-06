/**
 * Created by Sergey Krivorotov.
 */

public with sharing class GenericErrorHandlerExecutor {

    public static void execute(Scheduler scheduler) {
        ErrorHandlerSettings__c settings = ErrorHandlerSettings__c.getValues(scheduler.handler.getType().getName());
        scheduler.interval = settings.Interval__c.intValue();

        if (scheduler.status != 'Success' && scheduler.attempts < settings.Attempts__c.intValue()) {
            scheduler.schedule();
        }
    }
}