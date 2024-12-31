public class RandomContactFactory {

}public class RandomContactFactory {
    /**
     * Gera uma lista de contatos com base no número de contatos e sobrenome fornecidos.
     * 
     * @param numberOfContacts O número de contatos a serem gerados.
     * @param lastName O sobrenome comum a todos os contatos.
     * @return Uma lista de contatos gerados.
     */
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastName) {
        // Verificar se o número de contatos é válido
        if (numberOfContacts == null || numberOfContacts < 0) {
            throw new IllegalArgumentException('O número de contatos deve ser um número inteiro positivo.');
        }
        
        // Verificar se o sobrenome foi fornecido
        if (String.isBlank(lastName)) {
            throw new IllegalArgumentException('O sobrenome não pode ser nulo ou vazio.');
        }

        List<Contact> contacts = new List<Contact>();

        for (Integer i = 0; i < numberOfContacts; i++) {
            // Criar um novo contato com nome único e o sobrenome fornecido
            Contact contact = new Contact(
                FirstName = 'Teste ' + i,
                LastName = lastName
            );
            contacts.add(contact);
        }

        return contacts;
    }
}
