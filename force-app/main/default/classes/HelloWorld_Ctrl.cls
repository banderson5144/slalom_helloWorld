public without sharing class HelloWorld_Ctrl
{
    @AuraEnabled
    public static foo_Record__c[] getFooRecs()
    {
        return [Select Id,Name,CreatedDate,LastModifiedDate
                From foo_Record__c
                ORDER BY CreatedDate DESC
                LIMIT 10];
    }

    @AuraEnabled
    public static foo_Record__c[] upsertFooRecs(foo_Record__c[] fooRecs)
    {
        upsert fooRecs Id;

        Set<Id> sfIds = new Set<Id>();

        for(foo_Record__c f : fooRecs)
        {
            sfIds.add(f.Id);
        }

        return [Select Id,Name,CreatedDate,LastModifiedDate
                From foo_Record__c
                WHERE Id IN: sfIds
                ORDER BY CreatedDate DESC
                LIMIT 10];
    }
}
