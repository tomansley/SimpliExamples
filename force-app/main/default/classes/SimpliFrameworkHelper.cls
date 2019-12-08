/*
 * A utility class providing methods to call the Simpli Integration Manager easily.
 * This class illustrates how the framework is called and the different functions that
 * the SimpliFrameworkObjectHelper provides.
 */
public with sharing class SimpliFrameworkHelper {

    public static Simpli.SimpliFrameworkObject createSimpliObject(String name)
    {
        return Simpli.SimpliFrameworkObjectHelper.createSimpliFrameworkObject(name);
    }

    public static Simpli.SimpliFrameworkObject processSimpliObject(Simpli.SimpliFrameworkObject obj)
    {
        return Simpli.SimpliFrameworkObjectHelper.process(obj);
    }
}