/**
 * Created by Sergey Krivorotov.
 */

public abstract with sharing class GenericErrorHandler implements Schedulable, Queueable {

    public Integer attempts = 0;
    protected String status;
    protected Integer interval;

    public abstract Type getType();

    public abstract String getStatus();

    public void setInterval(Integer newValue) {
        interval = newValue;
    }

    public String buildCronExpression() {
        return System.now().second() + ' ' + (System.now().minute() + interval) + ' ' + System.now().hour() + ' ' +
                System.now().day() + ' ' + System.now().month() + ' ? '  + System.now().year();
    }

    public void schedule() {
        System.schedule(
                getType().getName() + System.now().getTime(),
                buildCronExpression(),
                this
        );
    }

    public void execute(SchedulableContext sc) {
        GenericErrorHandlerExecutor.execute(this);
    }

}