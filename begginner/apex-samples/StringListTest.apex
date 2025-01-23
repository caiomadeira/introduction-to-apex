public class StringListTest {
	
    public static List<String> generateStringList(Integer numStr)
    {
       List<String> listStr = new LIst<String>();
       // Usamos Integer para percorrer o for. O tipo primitivo int não existe em Apex.
        for(Integer i = 0; i < numStr; i++)
        {
            String str = 'Test ' + i;
            listStr.add(str);
        }
        return listStr;
    }
}