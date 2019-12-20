/*
 * @author Tom Ansley
 * @date 12/08/2019
 * @description Class which is a basic override implementation of the Simpli.SimpliFrameworkObject 
 * abstraction. It shows some of the basic features of the Simpli Integration Manager
 * including the creation of attributes, the processing of the simpli object, the handling
 * of attribute data and the handling of errors.
 */
global with sharing class SimpliProcessHelloWorld extends Simpli.SimpliFrameworkObject {
    
	global static final String ATTRIB_SIMPLI_TEST_ATTRIB = 'TestAttrib';

	global static final Integer EXCEPTION_UNKNOWN_ERROR  = 1;

    /*
     * Override method which gets called when the configured Simpli object is initialized. 
     * There is the option to override a preInit() method but we'll keep that for another time!
     */
    global override void init()
    {
		/*
         * Create the INPUT test attribute
         * This is the attribute that holds the initial value used for processing.
		 */
        Simpli.SimpliFrameworkAttribute attrib = new Simpli.SimpliFrameworkAttribute(ATTRIB_SIMPLI_TEST_ATTRIB);
		attrib.description = 'The input test attribute that will hold some string values which will get processed.';
		attrib.allowOverrides = true;
		attrib.required = true;
		addAttribute(attrib, Simpli.SimpliFrameworkAttribute.INPUT);

		/*
         * Create the OUTPUT test attribute
         * This is the attribute that holds the result after processing has completed.
         * An output attribute does not have to be created. Its useful for debugging 
         * purposes as well as required if the value is to be passed back to a calling 
         * system. An example might be a REST request passing back 3 or 4 attributes for
         * further processing by the calling system.
         */
		attrib = new Simpli.SimpliFrameworkAttribute(ATTRIB_SIMPLI_TEST_ATTRIB);
		attrib.description = 'The output test attribute that will hold some string values after processing.';
		addAttribute(attrib, Simpli.SimpliFrameworkAttribute.OUTPUT);
    }

    /*
     * Override method which handles the processing of the input data. At this point all
     * data has been initialized and is ready for the main processing of the object to
     * occur. It is this method typically where the main processing occurs and all output
     * attributes are set.
     * @return if there are no errors the processed object itself is returned. This method 
     * should always try to return an object of type Simpli.SimpliFrameworkObject even if 
     * there was an error during creation. In this instance the object returned should be
     * of type Simpli.SimpliFrameworkError.
     */
    global override Simpli.SimpliFrameworkObject process()
    {
        Simpli.SimpliFrameworkObject result = this;

        try {

            //get the provided input value
            String testAttribStr = getAttribute(ATTRIB_SIMPLI_TEST_ATTRIB).getStringValue();
            
            //output to the debug console
            System.debug(LoggingLevel.DEBUG, 'Test Attrib Input Value - ' + testAttribStr);
            
            //set the output value to "Hello World - " + the provided input value 
            getAttribute(ATTRIB_SIMPLI_TEST_ATTRIB, Simpli.SimpliFrameworkAttribute.OUTPUT).setValue('Hello World - ' + testAttribStr);

        } catch (Exception e) {
            result = Simpli.SimpliFrameworkObjectHelper.createProcessErrorObject('There was an error trying to process SimpliProcessHelloWorld', 
                                                                                 this,
                                                                                 e);

        }

        return result;
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

}