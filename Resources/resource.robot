*** Settings ***
Library   SeleniumLibrary
Library         Collections
Library         DatabaseLibrary
Library         OperatingSystem
Library         pyodbc

*** Variables ***
${DBName}          TESTE_ROBOT
${DBUser}          sa
${DBPassword}      aline
${DBHost}          PE08RBE8\SQLEXPRESS
${DBPort}          1433
${DBHost_ConnectionString}=  Set Variable    Server='PE08RBE8\SQLEXPRESS', Database='TESTE_ROBOT', Trusted_Connection='yes'

*** Keywords ***
Abrir o navegador
    Open Browser    browser=firefox 
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Conectar no banco de dados 
    DatabaseLibrary.Connect To Database   pyodbc  ${DBName}   ${DBUser}   ${DBPassword}   ${DBHost}   ${DBPort}

Fechar conexão com o banco de dados    
    Disconnect From Database
        