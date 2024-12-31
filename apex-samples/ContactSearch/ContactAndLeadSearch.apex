public class ContactAndLeadSearch {
    // O tipo List<List<sObject>> contém uma lista de contatos (Contact) e uma lista de leads (Lead).
    
    public static List<List<sObject>> searchContactsAndLeads(String str) {
        //O operador FIND realiza uma busca baseada em texto nos campos indexados.
        List<List<sObject>> results = [FIND :str IN ALL FIELDS 
                                       RETURNING Contact (Id, FirstName, LastName), 
                                                 Lead (Id, FirstName, LastName)];
        return results;
    }
}