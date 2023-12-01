*** Settings ***
Documentation    Suíte que verifica iframes
Resource         ../Resources/resource.robot
Resource         ../Resources/PageObjects/iframes_resource.robot
Test Setup       Abrir o navegador
# Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de teste 1 - Verificar iframes
    [Tags]             smoke
    Verificar iframe simples