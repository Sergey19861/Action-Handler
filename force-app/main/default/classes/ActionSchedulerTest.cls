/**
 * Created by Sergey Krivorotov.
 */

@IsTest
private class ActionSchedulerTest {

    @TestSetup
    static void setup() {
        insert new ActionSettings__c(
                Name = 'ActionUpdateRates',
                Interval__c = 1,
                Attempts__c = 3
        );
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

}