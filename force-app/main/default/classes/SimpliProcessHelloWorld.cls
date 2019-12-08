global with sharing class SimpliProcessHelloWorld extends Simpli.SimpliFrameworkObject {
    
	global static final String ATTRIB_SIMPLI_TEST_ATTRIB = 'TestAttrib';

    /*
     * Method which gets called when the configured Simpli object is initialized. There
     * is the option to override a preInit() method but we'll keep that for another time!
     */
    global override void init()
    {
		/*
         * Create the INPUT test attribute
         * This is the attribute that holds the initial value used for processing.
		 */
        Simpli.SimpliFrameworkAttribute attrib = new Simpli.SimpliFrameworkAttribute(ATTRIB_SIMPLI_TEST_ATTRIB);
		attrib.description = 'The test attribute that will hold some string values which will get processed.';
		attrib.allowOverrides = true;
		attrib.required = true;
		addAttribute(attrib, Simpli.SimpliFrameworkAttribute.INPUT);

		/*
         * Create the OUTPUT test attribute
         * This is the attribute that holds the result after processing has completed.
         * you do not need to create an output attribute if you do not want to. Its useful
         * for debugging purposes as well as required if the value is to be passed back to 
         * a calling system
         */
		attrib = new Simpli.SimpliFrameworkAttribute(ATTRIB_SIMPLI_TEST_ATTRIB);
		attrib.description = 'The test attribute that will hold some string values which will get processed.';
		addAttribute(attrib, Simpli.SimpliFrameworkAttribute.OUTPUT);
    }

    /*
     * Method which handles the processing of the input data.
     */
    global override Simpli.SimpliFrameworkObject process()
    {
        //get the provided input value
        String testAttribStr = getAttribute(ATTRIB_SIMPLI_TEST_ATTRIB).getStringValue();
        
        //output to the debug console
        System.debug(LoggingLevel.DEBUG, 'Test Attrib Input Value - ' + testAttribStr);
        
        //set the output value to "Hello World - " + the provided input value 
        getAttribute(ATTRIB_SIMPLI_TEST_ATTRIB, Simpli.SimpliFrameworkAttribute.OUTPUT).setValue('Hello World - ' + testAttribStr);
        
        return this;
    }

    /*
     * Method to create a configuration to use the above Simpli object.
     */
    global static void createBaseConfiguration()
    {
		List<Simpli__Simpli_Object__c> objects = new List<Simpli__Simpli_Object__c>();		
		
		Simpli__Simpli_Object__c soHello = new Simpli__Simpli_Object__c();
        soHello.Name = 'Example - Hello World'; 
		soHello.Simpli__Class_Name__c = 'SimpliProcessHelloWorld';
		soHello.Simpli__Description__c = 'Example configuration to show off how cool the world is!';
		soHello.Simpli__Is_Active__c = true;
		objects.add(soHello);

        insert objects;


		List<Simpli__Simpli_Attribute__c> attribs = new List<Simpli__Simpli_Attribute__c>();

		Simpli__Simpli_Attribute__c attrib = new Simpli__Simpli_Attribute__c();
		attrib.Name                = SimpliProcessHelloWorld.ATTRIB_SIMPLI_TEST_ATTRIB;
		attrib.Simpli__External_Name__c    = 'Test Attribute';
		attrib.Simpli__Allow_Overrides__c  = true;
		attrib.Simpli__Is_Required__c      = true;
		attrib.Simpli__Parent_Object__c    = soHello.Id;
		attrib.Simpli__Type__c             = 'Input';
		attribs.add(attrib);

        insert attribs;


    }
/*
    public static void test()
    {
        Simpli.SimpliFrameworkObject obj = SimpliFrameworkHelper.createSimpliObject('Example - Hello World');
        System.debug(LoggingLevel.ERROR, obj);
    }

    SimpliProcessHelloWorld.test();

    Organization org = [SELECT NamespacePrefix FROM Organization];
    System.debug(LoggingLevel.ERROR, 'NAMESPACE - ' + org.NamespacePrefix);

    System.debug(LoggingLevel.ERROR, Type.forName(null, 'SimpliProcessHelloWorld'));
    */
}
