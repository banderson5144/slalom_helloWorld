trigger fooRecTrigger on foo_Record__c (before insert)
{
    for(foo_Record__c fr : Trigger.new)
    {
        fr.Name += ' - triggered';
    }
}