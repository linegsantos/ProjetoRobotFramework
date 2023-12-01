*** Settings ***
Documentation    Suíte que verifica alertas no sistema
Resource         ../Resources/resource.robot
Resource         ../Resources/bdd-br.robot
Resource         ../Resources/PageObjects/alerts_resource.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de teste 1 - Verificar alerts apenas com OK
    [Documentation]    Suíte que verifica testes em alerts js
    [Tags]             smoke
    Dado acesso à tela de alerta
    Quando gerar o alert
    E então, ao clicar em ok, o teste é finalizado

Caso de teste 2 - Verificar alerts apenas com OK e cancelar
    [Tags]             smoke
    Dado acesso à tela de alerta
    Quando gerar o alert de confirmação
    E então, ao clicar em ok, o teste é terminado
