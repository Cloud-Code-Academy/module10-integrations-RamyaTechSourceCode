public class ContactTriggerHandler {

    public static void triggerBeforeInsert(List<Contact> contacts) {
        for(Contact con : contacts)
        {
            // When a contact is inserted
            // if DummyJSON_Id__c is null, generate a random number between 0 and 100 and set this as the contact's DummyJSON_Id__c value
            if(con.DummyJSON_Id__c == null)
            {
                con.DummyJSON_Id__c = String.valueOf((Integer) Math.floor(Math.random() * 101));
            }
            //When a contact is inserted
            // if DummyJSON_Id__c is less than or equal to 100, call the getDummyJSONUserFromId API
            else if(Integer.valueOf(con.DummyJSON_Id__c) <=100)
            {
                DummyJSONCallout.getDummyJSONUserFromId(con.id);
            }
        }
     }
     public static void triggerAfterUpdate(List<Contact> contacts) {
        for(Contact con : contacts)
        {
            //When a contact is updated
            // if DummyJSON_Id__c is greater than 100, call the postCreateDummyJSONUser API
            if(Integer.valueOf(con.DummyJSON_Id__c) > 100)
            {
                DummyJSONCallout.postCreateDummyJSONUser(con.DummyJSON_Id__c);
            }
        }
     }
}