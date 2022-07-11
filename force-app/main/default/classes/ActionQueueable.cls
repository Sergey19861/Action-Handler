/**
 * Created by Sergey Krivorotov.
 *
 * Designed to execute Action logic in an async thread.
 */

public with sharing class ActionQueueable implements Queueable, Database.AllowsCallouts {

    private Action action;

    public ActionQueueable(Action action) {
        this.action = action;
    }

    public void execute(QueueableContext qc) {
        ActionExecutor.execute(action);
    }

}