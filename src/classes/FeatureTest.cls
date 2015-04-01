@isTest(Oninstall=false)
private class FeatureTest {


	private static testMethod void test_PersonAccounts(){
		Boolean b = Schema.sObjectType.Account.fields.getMap().containsKey('PersonContactId');

		Test.startTest();

		system.assertEquals(b, Feature.PersonAccounts);

		Test.stopTest();
	}

	private static testMethod void test_Chatter(){
		Boolean b = Schema.getGlobalDescribe().containsKey('FeedItem');

		Test.startTest();

		system.assertEquals(b, Feature.Chatter);

		Test.stopTest();
	}

	private static testMethod void test_Edition(){
		String b = [SELECT OrganizationType FROM Organization].OrganizationType;

		Test.startTest();

		system.assertEquals(b, Feature.Edition);

		Test.stopTest();
	}

	private static testMethod void test_Sandbox(){
		Boolean b = [SELECT IsSandbox FROM Organization].IsSandbox;

		Test.startTest();

		system.assertEquals(b, Feature.IsSandbox);

		Test.stopTest();
	}

	private static testMethod void test_InstancePodName(){
		String baseUrl = URL.getSalesforceBaseUrl().toExternalForm();


		Test.startTest();

		system.assertEquals(true, baseUrl.contains(Feature.instancePodName));

		Test.stopTest();
	}


}