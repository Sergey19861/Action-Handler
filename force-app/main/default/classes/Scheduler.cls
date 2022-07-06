/**
 * Created by Sergey Krivorotov.
 */

public with sharing class Scheduler implements Schedulable {

    public Integer attempts = 0;
    public Integer interval;
    public String status;
    public GenericErrorHandler handler;

    public Scheduler(GenericErrorHandler handler) {
        this.handler = handler;
    }

    public String buildCronExpression() {
        return System.now().second() + ' ' + (System.now().minute() + interval) + ' ' + System.now().hour() + ' ' +
                System.now().day() + ' ' + System.now().month() + ' ? ' + System.now().year();
    }

    public void schedule() {
        System.schedule(
                handler.getType().getName() + System.now().getTime(),
                buildCronExpression(),
                this
        );
    }

    public void execute(SchedulableContext sc) {
        System.debug('Attempts: ' + attempts);
        attempts++;
        System.enqueueJob(handler);
        status = handler.status;
        System.debug('Status: ' + status);
        GenericErrorHandlerExecutor.execute(this);
    }

}