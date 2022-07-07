/**
 * Created by Sergey Krivorotov.
 */

@IsTest
private class ActionExecutorTest {

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