global with sharing class SimpliProcessBatchHelloWorld extends Simpli.SimpliFrameworkBatch {
    
    global SimpliProcessBatchHelloWorld() {

    }

	/*
	 * Method which is not required to be implemented but available if the user wants to override the
	 * validation. Always include the first line of this method example as it ensures that system
	 * validation is performed as expected. This method gets called during the 
	 * Batchable.start(Database.BatchableContext) method.
	 */
	global override Simpli.SimpliFrameworkObject validate()
	{
		Simpli.SimpliFrameworkObject result = super.validate();

		if (result == null)
		{
		}
		
		return result;
	}

	/*
	 * Method which gets called during the Batchable.start(Database.BatchableContext) method.
	 * This method gets called BEFORE the validate() method above meaning that attributes can
	 * be defined here.
	 */
	global override Simpli.SimpliFrameworkObject preProcessBatch()
	{



        return this;
    }

	/*
	 * Method which gets called during the Batchable.execute(Database.BatchableContext, List<SObject>) method.
	 */
	global override Simpli.SimpliFrameworkObject processBatch(List<SObject> scope)
	{

		System.debug(LoggingLevel.DEBUG, 'All processes extending the SimpliFrameworkBatch interface need to either provide a list of objects or a SOQL statement');
		if (getAttribute(Simpli.SimpliFrameworkBatch.ATTRIB_SOQL).getValue() != null)
			System.debug(LoggingLevel.DEBUG, 'This batch process provided a SOQL statement - ' + getAttribute(Simpli.SimpliFrameworkBatch.ATTRIB_SOQL).getStringValue());
		else {
			//Note that since the process provided data the scope variable provided to processBatch(scope) does not provide any useful data. It is expected that the data
			//provided will be sufficient to perform the necessary work and then either finish or create another batch job.
			System.debug(LoggingLevel.DEBUG, 'This batch process provided data - ' + getAttribute(Simpli.SimpliFrameworkBatch.ATTRIB_DATA).getValue());
		}

		for (SObject obj: scope)
			System.debug(LoggingLevel.DEBUG, 'Hello World. Hello object with Id - ' + obj.get('Id'));

		update scope;

        return this;
    }

	/*
	 * Method which gets called during the Batchable.finish(Database.BatchableContext) method.
	 */
	global override Simpli.SimpliFrameworkObject postProcessBatch()
	{
        return this;
    }

	/*
	 * Method which gets called if there are errors during the processing of the batch operation.
	 */
	global override void processError(Simpli.SimpliFrameworkObject errors)
	{
	}

    /*
     * Method to create a configuration to use the above Simpli object.
     */
    global static void createBaseConfiguration()
    {
		List<Simpli__Simpli_Object__c> objects = new List<Simpli__Simpli_Object__c>();		
		
		Simpli__Simpli_Object__c soHello = new Simpli__Simpli_Object__c();
        soHello.Name                     = 'Example - Batch - Hello World';
		soHello.Simpli__Class_Name__c    = 'SimpliProcessBatchHelloWorld';
		soHello.Simpli__Description__c   = 'Example configuration to show the basics of extending the SimpliFrameworkBatch interface. This configuration does nothing other than print to the debugging log as well as touch the records indicated by the provided SOQL';
		soHello.Simpli__Is_Active__c     = true;
		objects.add(soHello);

        insert objects;

    }

}