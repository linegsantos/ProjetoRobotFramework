*** Settings ***
Documentation    Suíte que verifica loops de comandos
Resource         ../Resources/resource.robot
Resource         ../Resources/bdd-br.robot
Resource         ../Resources/PageObjects/loops_resource.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de teste 1 - Verificar loops for
    [Documentation]    Suíte que verifica testes com for
    [Tags]             smoke
    Dado acesso ao site
    Quando fazer o login
    E então usando um loop For, os textos na seção Quick Launch são validados
