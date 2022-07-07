/**
 * Created by Sergey Krivorotov.
 *
 * Designed to execute logic form Action classes.
 */

public with sharing class ActionExecutor {

    public static void execute(Action action) {
        try {
            action.execute();
        } catch (ActionException ae) {
            action.incrementAttempt();
            new ActionScheduler(action).schedule();
        }
    }

}