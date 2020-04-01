@isTest
public class TestClass 
{
    @isTest
    static void testTrigger()
    {
        foo_Record__c fr = new foo_Record__c();

        fr.Name = 'foo';

        insert fr;

        String expectedValue = fr.Name + ' - triggered';

        fr = [Select Id,Name
              From foo_Record__c
              WHERE Id =: fr.Id];
        
        System.assertEquals(expectedValue,fr.Name);
    }

    @isTest
    static void testGetFooRecs()
    {
        foo_Record__c fr = new foo_Record__c();

        fr.Name = 'foo';

        insert fr;

        foo_Record__c[] fRecs = HelloWorld_Ctrl.getFooRecs();

        System.assertEquals(1,fRecs.size());
    }

    @isTest
    static void testUpsFooRecs()
    {
        foo_Record__c fr = new foo_Record__c();

        fr.Name = 'foo';

        foo_Record__c[] fRecs = HelloWorld_Ctrl.upsertFooRecs(new foo_Record__c[]{fr});

        String expectedValue = fr.Name + ' - triggered';

        System.assertEquals(expectedValue,fRecs[0].Name);
    }
}
