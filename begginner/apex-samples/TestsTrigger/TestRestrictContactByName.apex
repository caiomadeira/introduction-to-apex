@IsTest
public class TestRestrictContactByName {
    @IsTest
    static void testTriggerWithValidLastName() {
        // Cenário 1: Inserção com LastName válido
        Contact validContact = new Contact(FirstName = 'John', LastName = 'VALIDNAME');
        insert validContact;

        // Verifica se o contato foi inserido corretamente
        Contact insertedContact = [SELECT Id, LastName FROM Contact WHERE Id = :validContact.Id];
        System.assertEquals('VALIDNAME', insertedContact.LastName, 'O sobrenome deve ser "VALIDNAME".');

        // Cenário 2: Atualização com LastName válido
        validContact.LastName = 'ANOTHERVALIDNAME';
        update validContact;

        // Verifica se o contato foi atualizado corretamente
        Contact updatedContact = [SELECT Id, LastName FROM Contact WHERE Id = :validContact.Id];
        System.assertEquals('ANOTHERVALIDNAME', updatedContact.LastName, 'O sobrenome deve ser "ANOTHERVALIDNAME".');
    }

    @IsTest
    static void testTriggerWithInvalidLastName() {
        // Cenário 3: Inserção com LastName inválido
        Contact invalidContact = new Contact(FirstName = 'Jane', LastName = 'INVALIDNAME');
        Test.startTest();
        try {
            insert invalidContact;
            System.assert(false, 'A inserção deveria ter falhado devido ao LastName inválido.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'), 
                          'A mensagem de erro deveria indicar que o sobrenome é inválido.');
        }
        Test.stopTest();

        // Cenário 4: Atualização para LastName inválido
        Contact validContact = new Contact(FirstName = 'John', LastName = 'VALIDNAME');
        insert validContact;

        validContact.LastName = 'INVALIDNAME';
        Test.startTest();
        try {
            update validContact;
            System.assert(false, 'A atualização deveria ter falhado devido ao LastName inválido.');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'), 
                          'A mensagem de erro deveria indicar que o sobrenome é inválido.');
        }
        Test.stopTest();
    }
}
