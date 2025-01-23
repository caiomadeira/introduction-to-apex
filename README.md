### Introdução ao Apex
Apex é uma linguagem de programação com uma sintaxe bastante similiar à do Java
e funciona como procedimentos armazenados no banco de dados. O Apex permite lógica de negócios a eventos do sistema, tais como cliques em botões, atualizações de registros relacionados e páginas do Visualforce.

- O Apex é salvo, compilado e executado no servidor, que é a Lightning Platform.

- Altamente controlada, ou seja cada código é rigorosamente 'olhado' caso haja a necessidade de imposição de limites.

- Orientado a objetos e altamente tipificado.

- Integração ao banco de dados (SOQL) nativa.

- Não é CASE SENSITIVE.

- Seu 'sObject' (Objeto padrão) é equivalente ao 'Object' de java (e demais linguagens).


### Variáveis Bind
É uma maneira de fazer seu código sob medida. É aí que entram as variáveis bind. Uma variável bind é uma variável do Apex que você usa em uma consulta SOQL. Use variáveis bind como espaços reservados para valores específicos que serão fornecidos posteriormente.

```
Integer maxHomeValue = 200000;
List<Property__c> property = [SELECT Name, Price__c FROM Property__c WHERE Price__c < :maxHomeValue];  
```
A variável bind é precedida por dois pontos ( : ). É basicamente a possibilidade de adicionar variaveis a uma consulta SOQL.

### Funções agregadas (Agregadores)
Semelhante as funções de agregação do SQL (MAX, MIN, AVG, etc).