/**
 * Created by Sergey Krivorotov.
 *
 * Parent class for all Actions.
 */

public abstract with sharing class Action {

    public Integer attemptNumber = 1;

    public abstract Type getType();

    public abstract void execute();

    public void incrementAttempt() {
        attemptNumber++;
    }

}