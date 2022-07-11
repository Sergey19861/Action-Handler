/**
 * Created by Sergey Krivorotov.
 *
 * Designed to schedule new Action job according Action settings.
 */

public with sharing class ActionScheduler implements Schedulable {

    public ActionSettings__c actionSettings;
    public Action action;

    public ActionScheduler(Action action) {
        this.action = action;
        actionSettings = ActionSettings__c.getValues(action.getType().getName());
    }

    public void schedule() {
        if (action.attemptNumber > actionSettings.Attempts__c.intValue()) return;
        System.schedule(
                action.getType().getName() + System.now().getTime(),
                buildCronExpression(),
                this
        );
    }

    public void execute(SchedulableContext sc) {
        System.enqueueJob(new ActionQueueable(action));
    }

    private String buildCronExpression() {
        return System.now().second() + ' ' + (System.now().minute() + actionSettings.Interval__c.intValue()) + ' ' + System.now().hour() + ' ' +
                System.now().day() + ' ' + System.now().month() + ' ? ' + System.now().year();
    }

}