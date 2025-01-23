trigger RestrictContactByName on Contact (before insert, before update) {
    // Verifica os contatos antes de inserções ou atualizações para dados inválidos
    for (Contact c : Trigger.New) {
        if (c.LastName == 'INVALIDNAME') {
            // INVALIDNAME é inválido
            c.AddError('The Last Name "' + c.LastName + '" is not allowed for DML');
        }
    }
}