({
    doInit : function(cmp, evt, help)
    {
        var action = cmp.get("c.getFooRecs");

        action.setCallback(this, function(response)
        {
            var state = response.getState();
            
            if (state === "SUCCESS")
            {
                cmp.set("v.cmpFooRecs", response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
    },

    addRec: function(cmp,evt,help)
    {
        var fooRecs = cmp.get('v.cmpFooRecs');

        fooRecs.push({sobjectType:'foo_Record__c'});

        cmp.set('v.cmpFooRecs',fooRecs);
    },

    upsFooRecs: function(cmp,evt,help)
    {
        var action = cmp.get("c.upsertFooRecs");

        action.setParams({fooRecs:cmp.get('v.cmpFooRecs')});

        action.setCallback(this, function(response)
        {
            var state = response.getState();
            
            if (state === "SUCCESS")
            {
                cmp.set("v.cmpFooRecs", response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
    }
})
