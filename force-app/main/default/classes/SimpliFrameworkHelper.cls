/*
 * A utility class providing methods to call the Simpli Integration Manager easily.
 * This class illustrates how the framework is called and the different functions that
 * the SimpliFrameworkObjectHelper provides.
 */
public with sharing class SimpliFrameworkHelper {

    /*
     * Method to create and initialize a simpli object. This method will always return an object
     * of type Simpli.SimpliFrameworkObject even if there was an error during creation. In this 
     * instance the object returned is of type Simpli.SimpliFrameworkError. Note that when a 
     * configuration is returned it should be ready for external values to be added and to be
     * processed using the object helper.
     * @param name the name of a configuration from which values are used to initialize the simpli object
     * @return the newly created and initialized Simpli object. 
     */
    public static Simpli.SimpliFrameworkObject createSimpliObject(String name)
    {
        return Simpli.SimpliFrameworkObjectHelper.createSimpliFrameworkObject(name);
    }

    /*
     * Method to process a simpli object after the external name/value pairs have been set.
     * @param obj the configured, populated simpli object that is ready to be processed.
     * @return if no errors the same simpli object with all output attributes populated. If
     * errors are encountered the object returned is of type Simpli.SimpliFrameworkError.
     */
    public static Simpli.SimpliFrameworkObject processSimpliObject(Simpli.SimpliFrameworkObject obj)
    {
        return Simpli.SimpliFrameworkObjectHelper.process(obj);
    }

    /*
     * Convenience method to return all configurations that are active and available to be used.
     * Note that SYSTEM configurations are never returned.
     * @return a map of configurations by configuration name.
     */
    public static Map<String, Simpli__Simpli_Object__c> getAllConfigurations()
    {
        return Simpli.SimpliFrameworkObjectHelper.getConfigurations();
    }

    /*
     * Convenience method to return batch configurations that are active and available to be used.
     * Batch configurations include all where the class name references a class which implements
     * the Simpli.SimpliFrameworkBatch interface.
     * Note that SYSTEM configurations are never returned.
     * @return a map of configurations by configuration name.
     */
    public static Map<String, Simpli__Simpli_Object__c> getAllBatchConfigurations()
    {
        return Simpli.SimpliFrameworkObjectHelper.getConfigurations(null, Simpli.SimpliFrameworkObjectHelper.CONFIG_TYPE_BATCH);
    }

    /*
     * Convenience method to return configurations that are active, available to be used and
     * do not implement the batch interface.
     * Note that SYSTEM configurations are never returned.
     * @return a map of configurations by configuration name.
     */
    public static Map<String, Simpli__Simpli_Object__c> getNoBatchConfigurations()
    {
        return Simpli.SimpliFrameworkObjectHelper.getConfigurations(null, Simpli.SimpliFrameworkObjectHelper.CONFIG_TYPE_BATCH);
    }

    /*
     * Convenience method to return all configurations that are active, available to be used and
     * may implement the batch interface but where the SFDC Object API Name is "Account". This is
     * useful when configurations need to be found based on an existing object type.
     * Note that SYSTEM configurations are never returned.
     * @return a map of configurations by configuration name.
     */
    public static Map<String, Simpli__Simpli_Object__c> getAccountConfigurations()
    {
        return Simpli.SimpliFrameworkObjectHelper.getConfigurations('Account', Simpli.SimpliFrameworkObjectHelper.CONFIG_TYPE_ALL);
    }

}