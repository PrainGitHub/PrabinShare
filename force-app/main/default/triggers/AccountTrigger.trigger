trigger AccountTrigger on Account (After insert,After update,before update,before insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        AccountHandler.createReletedContact(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isupdate){
       AccountHandler.UpdateReletedContact(Trigger.new);
    }
if(Trigger.isbefore && Trigger.isupdate || Trigger.isinsert){
        AccountHandler.ActivationSummaryfieldValueUpdate(Trigger.new);
    }
}