@IsTest
public class TestVerifyDate {
    // Teste para verificar o comportamento do método CheckDates
    @IsTest
    static void testCheckDates() {
        // Cenário 1: date2 está dentro dos próximos 30 dias de date1
        Date date1 = Date.newInstance(2023, 6, 1);
        Date date2Within30Days = Date.newInstance(2023, 6, 15);
        Date result1 = VerifyDate.CheckDates(date1, date2Within30Days);
        System.assertEquals(date2Within30Days, result1, 'date2 está dentro dos próximos 30 dias e deveria ser retornado.');

        // Cenário 2: date2 é anterior a date1
        Date date2BeforeDate1 = Date.newInstance(2023, 5, 15);
        Date result2 = VerifyDate.CheckDates(date1, date2BeforeDate1);
        Date expectedEndOfMonth = Date.newInstance(2023, 6, 30);
        System.assertEquals(expectedEndOfMonth, result2, 'date2 está antes de date1, então o último dia do mês deveria ser retornado.');

        // Cenário 3: date2 está fora do intervalo de 30 dias
        Date date2Outside30Days = Date.newInstance(2023, 7, 5);
        Date result3 = VerifyDate.CheckDates(date1, date2Outside30Days);
        System.assertEquals(expectedEndOfMonth, result3, 'date2 está fora dos próximos 30 dias, então o último dia do mês deveria ser retornado.');
    }

    // Teste para verificar o comportamento com diferentes meses
    @IsTest
    static void testEndOfMonthDate() {
        // Cenário 4: Verificar o retorno correto para o último dia de meses com 31 dias
        Date date1 = Date.newInstance(2023, 7, 1); // Julho (31 dias)
        Date date2BeforeDate1 = Date.newInstance(2023, 6, 1);
        Date result = VerifyDate.CheckDates(date1, date2BeforeDate1);
        Date expectedEndOfMonth = Date.newInstance(2023, 7, 31);
        System.assertEquals(expectedEndOfMonth, result, 'O último dia do mês deveria ser 31 de julho.');

        // Cenário 5: Verificar o retorno correto para fevereiro (ano não bissexto)
        date1 = Date.newInstance(2023, 2, 1); // Fevereiro (28 dias)
        date2BeforeDate1 = Date.newInstance(2023, 1, 1);
        result = VerifyDate.CheckDates(date1, date2BeforeDate1);
        expectedEndOfMonth = Date.newInstance(2023, 2, 28);
        System.assertEquals(expectedEndOfMonth, result, 'O último dia do mês deveria ser 28 de fevereiro.');
    }
}
