public class ContactSearch {
	public static List<Contact> searchForContacts(String surname, String postalCode)
    {
        /*
         * 	Realiza uma consulta SOQL ja salvando o conteudo na lista 
         * 
        */
        List<Contact> contacts = [SELECT Id, Name FROM Contact
                                 WHERE LastName = :surname AND MailingPostalCode = :postalCode];
    	return contacts; 
    }
}