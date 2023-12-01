*** Settings ***
Documentation    Teste que verifica donwloads e uploads de arquivos
Resource         ../Resources/resource.robot
Resource         ../Resources/bdd-br.robot
Resource         ../Resources/PageObjects/files_resource.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de teste 1 - Verificar upload de arquivos
    [Documentation]    Teste que verifica upload de arquivos
    [Tags]             smoke
    Dado acesso à tela upload de arquivos
    Quando clicar no botão Navegar
    E então ao selecionar o arquivo, o teste é finalizado

Caso de teste 2 - Verificar download de arquivos
    [Documentation]    Teste que verifica download de arquivos
    [Tags]             smoke
    Dado acesso à tela download de arquivos
    Quando adicionar o texto
    E ao clicar em Download
    E então o arquivo será baixado