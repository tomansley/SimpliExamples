public with sharing class SimpliProcessBatchEmpty  extends Simpli.SimpliFrameworkBatch {
    public SimpliProcessBatchEmpty() {

    }

	/*
	 * Method which gets called during the Batchable.start(Database.BatchableContext) method.
	 */
	public override Simpli.SimpliFrameworkObject preProcessBatch()
	{
        return this;
    }

	/*
	 * Method which gets called during the Batchable.execute(Database.BatchableContext, List<SObject>) method.
	 */
	public override Simpli.SimpliFrameworkObject processBatch(List<SObject> scope)
	{
        return this;
    }

	/*
	 * Method which gets called during the Batchable.finish(Database.BatchableContext) method.
	 */
	public override Simpli.SimpliFrameworkObject postProcessBatch()
	{
        return this;
    }

	/*
	 * Method which gets called if there are errors during the processing of the batch operation.
	 */
	public override void processError(Simpli.SimpliFrameworkObject errors)
	{
	}

}