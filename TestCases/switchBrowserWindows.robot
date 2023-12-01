*** Settings ***
Documentation    Suíte que verifica a mudança de várias janelas no navegador
Resource         ../Resources/resource.robot
Resource         ../Resources/PageObjects/swithBrowserWindows_resource.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de teste 1 - Verificar várias janelas no navegador
    [Tags]             smoke
    Verificar várias janelas no navegador