*** Settings ***
Documentation    Suíte que verifica libraries avançadas
Resource         ../Resources/resource.robot
Resource         ../Resources/PageObjects/librariesAvancadas_resource.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de teste 1 - Pegando data e hora atuais
    [Documentation]    Suíte que verifica a library Datetime
    [Tags]             smoke
    Teste pegando data atual
    Teste pegando data e hora atuais
    Teste pegando ano - mês - dia separadamente
    Trabalhando com tempo
    Adicionando tempo de data
    Subtraindo tempo de data

Caso de teste 2 - Lidando com linhas de um texto String
    [Documentation]    Suíte que verifica a library String
    [Tags]             smoke
    Pega arquivo
    Contando as linhas
    Pegando uma linha específica
    Pegando uma linha específica com a palavra "linha 01"
    Pegando até um marcador

Caso de teste 3 - Manipulando a String
    Substituindo valores no texto
    Quero tudo minúsculo!
    Quero tudo maiúsculo!

Caso de teste 4 - Abrindo programas com a library Process
    [Documentation]    Suíte que verifica a library Process
    [Tags]             smoke
    Abra e feche o Notepad

Caso de teste 5 - Execute comandos de prompt
    Executando comandos diversos de prompt

Caso de teste 6 - Use pass executing if
    Pass Execution    Fechar o navegador passed
    Log to Console    Teardown