public class AccountHandler {
	public static Account insertNewAccount(String accountName)
    {
        try
        {
            // Aqui criamos um novo obj account
            Account newAccount = new Account(Name = accountName);
            insert newAccount; // inserimos o registro no db salesforce
            return newAccount; // retornamos
            
        } catch (DmlException e)
        {
            return null; // caso falhe, usamos try catch p/ capturar a excecao
        }
    }
}