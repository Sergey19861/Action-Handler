/**
 * Created by Sergey Krivorotov.
 */

public abstract with sharing class GenericErrorHandler implements Schedulable {

    public Integer attempts;
    protected String status;
    protected Integer interval;

    public GenericErrorHandler(Integer attempts, Integer interval) {
        this.attempts = attempts;
        this.interval = interval;
    }

    public abstract Type getType();

    public String getStatus() {
        return status;
    }

    public String buildCronExpression() {
        return System.now().second() + ' ' + (System.now().minute() + interval) + ' ' + System.now().hour() + ' ' +
                System.now().day() + ' ' + System.now().month() + ' ? '  + System.now().year();
    }

}