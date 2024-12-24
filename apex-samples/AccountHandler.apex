public class AccountHandler {
    public static void insertAccount(Integer newAcctAmount)
    {
        Integer N = 1;
        List<Account> addAccounts = new List<Account>();
        while(N <= newAcctAmount)
        {
            Account newAcct = new Account();
            newAcct.Name = 'Acme Inc' + N;
            newAcct.AccountNumber = 'A000' + N;
            addAccounts.add(newAcct);
            System.debug(newAcct);
			N++;            
        }
        System.debug('Size of Account List: ' + addAccounts.size());
        System.debug('Elements in Account List: ' + addAccounts);
        // Usando DML para inserir todas as contas de uma vez
        insert addAccounts;
    }
}