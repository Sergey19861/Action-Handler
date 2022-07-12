/**
 * Created by Sergey Krivorotov.
 *
 * Created to test Project classes functionality.
 */

@IsTest
private class ActionExecutorTest {

    @TestSetup
    static void setup() {
        insert new ActionSettings__c(
                Name = 'ActionUpdateRates',
                Interval__c = 1,
                Attempts__c = 3
        );
    }

    @IsTest
    static void testScheduleEmptySettings() {
        delete [SELECT Name FROM ActionSettings__c];
        MockFactory mock = new MockFactory(404, 'Failed', '', new Map<String, String>());
        Test.setMock(HttpCalloutMock.class, mock);
        Test.startTest();
        ActionExecutor.execute(new ActionUpdateRates());
        Test.stopTest();
        List<AsyncApexJob> jobs = [SELECT Id FROM AsyncApexJob];

        System.assertEquals(0, jobs.size());
    }

    @IsTest
    static void testSchedule() {
        MockFactory mock = new MockFactory(404, 'Failed', '', new Map<String, String>());
        Test.setMock(HttpCalloutMock.class, mock);
        Test.startTest();
        ActionScheduler scheduler = new ActionScheduler(new ActionUpdateRates());
        scheduler.schedule();
        Test.stopTest();
        List<AsyncApexJob> jobs = [SELECT Id FROM AsyncApexJob];

        System.assertEquals(2, jobs.size());
        System.assertEquals(3, scheduler.actionSettings.Attempts__c.intValue());
        System.assertEquals(1, scheduler.actionSettings.Interval__c.intValue());
    }

    @IsTest
    static void testExecute() {
        MockFactory mock = new MockFactory(200, 'OK', '', new Map<String, String>());
        Test.setMock(HttpCalloutMock.class, mock);
        Test.startTest();
        ActionExecutor.execute(new ActionUpdateRates());
        Test.stopTest();
        List<AsyncApexJob> jobs = [SELECT Id FROM AsyncApexJob];

        System.assertEquals(0, jobs.size());
    }

}