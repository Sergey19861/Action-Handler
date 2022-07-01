/**
 * Created by Sergey Krivorotov.
 */

public with sharing class GenericErrorHandlerExecutor {

    public static void execute(GenericErrorHandler errorHandler) {
        for (Integer i = 0; i < errorHandler.attempts; i++) {
            String jobID = System.schedule(
                    errorHandler.getType().getName() + System.now().getTime(),
                    errorHandler.buildCronExpression(),
                    errorHandler
            );
            System.debug('Status: ' + errorHandler.getStatus());
            System.debug('Cron expression: ' + errorHandler.buildCronExpression());
            if (errorHandler.getStatus() == 'Success') break;
        }
    }
}