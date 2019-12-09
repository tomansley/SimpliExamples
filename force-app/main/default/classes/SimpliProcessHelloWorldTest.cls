@IsTest
public with sharing class SimpliProcessHelloWorldTest {

    @testSetup
    private static void createSampleData()
    {
		Simpli.SimpliFrameworkObjectHelper.insertCoreConfiguration();
        SimpliProcessHelloWorld.createBaseConfiguration();
    }

	static testMethod void testProcessHelloWorld() {
			
		Simpli.SimpliFrameworkObject obj = Simpli.SimpliFrameworkObjectHelper.createSimpliFrameworkObject('Example - Hello World');		
		obj.setValue('Test Attribute', 'Test Value');
		obj = Simpli.SimpliFrameworkObjectHelper.process(obj);

		//------------------------------------------------------------------------
		//TEST RESULTS
	
		System.assertEquals('Hello World - Test Value', obj.getAttribute(SimpliProcessHelloWorld.ATTRIB_SIMPLI_TEST_ATTRIB, Simpli.SimpliFrameworkAttribute.OUTPUT).getStringValue());

		
	}
}