/*
 * Class which is a basic shell for extending the Simpli framework. This class could be
 * called through configuration although it wouldn't do anything. Note that this class
 * does not extend SimpliFrameworkSFDCObject which is what a developer needs if they want
 * to configure a Salesforce standard or custom object.
 */
global with sharing class SimpliProcessEmpty extends Simpli.SimpliFrameworkObject {
    
    global override void init()
    {

    }

    global override Simpli.SimpliFrameworkObject process()
    {
        return this;
    }
}
