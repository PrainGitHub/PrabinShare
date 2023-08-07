@isTest
public class AccounthandlerTestclass {
    @isTest static void testcreateReletedContact(){
        List<account> accountlist = new  List<account> ();
        List<contact> Contactlist = new  List<contact> ();
        
        for(integer i = 1;i<5;i++){
            account acc = new account();
            acc.Name = 'Test Account'+1;
            acc.Active__c = true;
            acc.Type = 'Customer - Direct';
            acc.phone = '875498568';
            acc.AccountActivationSummary__c = 'this is summery';
            accountlist.add(acc);
        }
        test.startTest();
        insert accountlist;
        for(Account acc :accountlist){
            contact con = new contact();
            con.FirstName = acc.Name;
            con.LastName = 'Represtive';
            con.Phone = acc.Phone;
            con.accountid = acc.id;
            Contactlist.add(con);
        }
        insert Contactlist;
        test.stopTest();
       List<Contact> UpdateContactlist = [Select id,Phone From Contact Where Id =:Contactlist[0].id];
        system.assertNotEquals('5446545',UpdateContactlist[0].phone );
    }
     @isTest static void testUpdateReletedContact(){
        List<account> accountlist = new  List<account> ();
        List<contact> Contactlist = new  List<contact> ();
        
        for(integer i = 1;i<5;i++){
            account acc = new account();
            acc.Name = 'Test Account'+1;
            acc.Active__c = true;
            acc.Type = 'Customer - Direct';
            acc.phone = '875498568';
            acc.AccountActivationSummary__c = 'this is summery';
            accountlist.add(acc);
        }
        
        insert accountlist;
        for(Account acc :accountlist){
            contact con = new contact();
            con.FirstName = acc.Name;
            con.LastName = 'Represtive';
            con.Phone = acc.Phone;
            con.accountid = acc.id;
            Contactlist.add(con);
        }
        insert Contactlist;
         test.startTest();
                AccountHandler.UpdateReletedContact(accountlist);

        test.stopTest();
    }
}