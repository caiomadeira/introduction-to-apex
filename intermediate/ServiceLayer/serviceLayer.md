## Service Layer

A camada de serviço define o limite de um aplicativo com uma camada de serviço que estabelece um conjunto de operações disponíveis e coordena a resposta do aplicativo em cada operação.

A camada de serviço ajuda a formar um encapsulamento claro e restrito de código ao implementar tarefas comerciais, cálculos e processos.

---
### Uso
O cliente (usuário da camada) não usa a camada de serviço diretamente e, através disso invoca o código através de outras partes do código que interagem com o usuário ou sistema.

--- 
### Código
- Use o modificador ``` with sharing ``` nas suas classes de serviço do Apex (importante caso oce estiver expondo esse codigo pelo modificador global). Se a lógica do Apex precisar acessar registros não incluidos na visibilidade do usuário, o código precisará elevar o contexto de execução explicitamente o mais rapidamente possível. Uma boa abordagem é usar uma classe do Apex interna privada com a aplicação do modificador ``` without sharing ```.

- 