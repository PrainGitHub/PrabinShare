public class AccountHandler {
    public static void  ActivationSummaryfieldValueUpdate(List<Account>newAccountList){
        List<Contact> contactListToUpdate = New  List<Contact>();
        if(newAccountList.size()>0){
            for(Account acc : newAccountList){
                if(acc.Active__c ==true &&String.isBlank(acc.AccountActivationSummary__c)){
                    acc.AccountActivationSummary__c.addError ('Account Activation Summary can not be Blank');
                }
            }
        }
    }
    public static void createReletedContact(List<Account>newAccountList){
        List<Contact> contactListToUpdate = New  List<Contact>();
        if(newAccountList.size()>0){
            for(Account acc : newAccountList){
                if(acc.Type == 'Customer - Direct'||acc.Type == 'Customer - Channel'){
                    if(acc.Active__c){
                        Contact con = New contact();
                        con.FirstName = acc.name;
                        con.LastName = 'Customer Representative';
                        con.Email = acc.CompanyEmail__c;
                        con.phone = acc.Phone;
                        con.AccountId = acc.id;
                        contactListToUpdate.add(con);
                    }
                }
            }
        }
        if(contactListToUpdate.size()>0){
            insert contactListToUpdate;
        }
    }
    
    public static void UpdateReletedContact(List<Account>newAccountList){
        List<Contact> contactListToUpdate = New  List<Contact>();
        if(newAccountList.size()>0){
            List<account>Accountlist = [Select id,name,CompanyEmail__c,AccountActivationSummary__c,Phone,type,Active__c, 
                                        (Select id,firstname,lastname,Email,phone FROM Contacts)
                                        FROM account WHERE ID IN :newAccountList];
            for(account ac: newAccountList){
                if(ac.Type == 'Customer - Direct'||ac.Type == 'Customer - Channel' && ac.Active__c == true){
                    if(ac.Contacts.size() == 0){
                        Contact con = New contact();
                        con.FirstName = ac.name;
                        con.LastName = 'Customer Representative';
                        con.Email = ac.CompanyEmail__c;
                        con.phone = ac.Phone;
                        con.AccountId = ac.id;
                        contactListToUpdate.add(con);
                    }
                }
            }
        }
        if(contactListToUpdate.size()>0){
            insert contactListToUpdate;
        }
        
    }
}