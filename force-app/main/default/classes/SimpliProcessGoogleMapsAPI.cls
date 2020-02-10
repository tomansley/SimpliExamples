/*
 * @author Tom Ansley
 * @date 02/10/2020
 * @description Class which handles callouts to the Google Maps API and makes the data available
 * in the Simpli Integration Manager.
 */
global with sharing class SimpliProcessGoogleMapsAPI extends Simpli.SimpliFrameworkObject {
    
	global static final String ATTRIB_API_KEY_LOCATION   = 'APIKeyLocation';
    global static final String ATTRIB_API_KEY            = 'APIKey';
    
	global static final String ATTRIB_LATITUDE           = 'Latitude';
	global static final String ATTRIB_LONGITUDE          = 'Longitude';
	global static final String ATTRIB_LAT_LONG_TYPE      = 'LatLongType';

    global static final String ATTRIB_STREET_NUMBER      = 'StreetNumber';
    global static final String ATTRIB_STREET             = 'Street';
    global static final String ATTRIB_NEIGHBORHOOD       = 'Neighborhood';
    global static final String ATTRIB_COUNTY             = 'County';
    global static final String ATTRIB_CITY               = 'City';
    global static final String ATTRIB_STATE              = 'State';
    global static final String ATTRIB_COUNTRY            = 'Country';
    global static final String ATTRIB_ZIPCODE            = 'Zipcode';
    global static final String ATTRIB_FORMATTED_ADDRESS  = 'FormattedAddress';
    global static final String ATTRIB_PLUS_CODE_COMPOUND = 'PlusCodeCompound';
    global static final String ATTRIB_PLUS_CODE_GLOBAL   = 'PlusCodeGlobal';


	global static final Integer EXCEPTION_UNKNOWN_ERROR  = 1;

    /*
     * Override method which gets called when the configured Simpli object is initialized. 
     * There is the option to override a preInit() method!
     */
    global override void init()
    {
        Simpli.SimpliFrameworkAttribute attrib = new Simpli.SimpliFrameworkAttribute(ATTRIB_API_KEY_LOCATION);
		attrib.description = 'Identifies where the Google Maps API key is located within the SFDC org.';
		attrib.allowOverrides = true;
		attrib.required = true;
		addAttribute(attrib, Simpli.SimpliFrameworkAttribute.INPUT);

		attrib = new Simpli.SimpliFrameworkAttribute(ATTRIB_API_KEY_LOCATION);
		attrib.description = 'Identifies where the Google Maps API key is located within the SFDC org.';
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
/*		List<Simpli__Simpli_Object__c> objects = new List<Simpli__Simpli_Object__c>();		
		
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
*/
    }

}