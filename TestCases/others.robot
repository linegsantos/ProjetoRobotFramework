*** Settings ***
Documentation    Teste que verifica diferentes comandos no sistema
Resource         ../Resources/resource.robot
Resource         ../Resources/bdd-br.robot
Resource         ../Resources/PageObjects/others_resource.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de teste 1 - Verificar datepicker
    [Documentation]    Teste que verifica elementos com datepicker
    [Tags]             smoke
    Dado acesso à tela datepicker
    Quando selecionar a data inical
    E então, ao selecionar a data final, o teste é finalizado
