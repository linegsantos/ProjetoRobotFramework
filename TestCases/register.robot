*** Settings ***
Documentation    Suíte que verifica a o cadastro no sistema
Resource         ../Resources/resource.robot
Resource         ../Resources/bdd-br.robot
Resource         ../Resources/PageObjects/register_resource.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de teste 1 - Realizar cadastro
    [Documentation]    Suíte que verifica o cadastro no sistema
    [Tags]             regression
    Dado acesso ao sistema
    Quando preencher os dados
    E selecionar o arquivo
    E então o cadastro será salvo