/*

Create a class
Name: PropertyUtility
Create a method
Name: newListedProperties
Keywords: public, static, and void
Create a list
Name: newPropList
Create a query and assign the query results to the list
Get this information:
The name of the property
The broker’s email address
How long the property has been on market
(Hint: Use API names, not field names or field labels)
Object: Property
Condition: The property was listed within the last 30 days
Create a for loop that iterates through the query results
Object: Property
List name: newPropList
For each item, concatenate the property name, followed by a colon, followed by the broker’s email address: <Property Name> : <Broker Email>
Store the concatenated string in a variable named propEmail
Print the propEmail variable to the debug log

*/

public class PropertyUtility {
	public static void newListedProperties()
    {
        List<Property__c> newPropList = [
            SELECT Name, Broker__r.Email__c, Days_On_Market__c 
            FROM Property__c 
            WHERE Date_Listed__c = LAST_N_DAYS:30
         ];
        for(Property__c prop: newPropList)
        {
			String propEmail = prop.Name + ' : ' + prop.Broker__r.Email__c; 
            system.debug(propEmail);
        }
    }
}	