*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Library    FakerLibrary

*** Variables ***
#url
${URL_ALERT}               https://demo.automationtesting.in/Alerts.html

# itens no menu
${MENU_ALERT_OK}           //a[@href='#OKTab'][contains(.,'Alert with OK')]
${MENU_ALERT_OKCANCEL}    //a[contains(.,'Alert with OK & Cancel')]
${MENU_ALERT_TEXTBOX}     //a[contains(@aria-expanded,'true')]

# botões
${BTN_OK}                 OKTab
${BTN_CANCEL}             CancelTab
${BTN_TEXTBOX}            Textbox

*** Keywords ***

# Caso de teste 1 - Verificar alerts apenas com ok

acesso à tela de alerta
    Go To            ${URL_ALERT}
    Wait Until Element Is Visible    ${MENU_ALERT_OK}            timeout=3s

gerar o alert
    Click Element    ${BTN_OK}
    Sleep    3s                                   

então, ao clicar em ok, o teste é finalizado
    ${MESSAGE}    Handle Alert    accept
    Should Be Equal    ${MESSAGE}     I am an alert box!

# Caso de teste 2 - Verificar alerts apenas com OK e cancelar
    
gerar o alert de confirmação
    Click Element    ${MENU_ALERT_OKCANCEL}
    Wait Until Element Is Visible    ${BTN_CANCEL}

    Click Element    ${BTN_CANCEL}
    Sleep    3s

então, ao clicar em ok, o teste é terminado
    ${MESSAGE}    Handle Alert    accept
    # Handle Alert    dismiss
    Should Be Equal    ${MESSAGE}     Press a Button !

    