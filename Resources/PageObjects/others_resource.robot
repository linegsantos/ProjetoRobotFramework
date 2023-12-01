*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Library    FakerLibrary


*** Variables ***
#url
${URL_DATEPICKER}      https://demo.automationtesting.in/Datepicker.html
${URL_SLIDER}          https://demo.automationtesting.in/Slider.html

# calendario
${DATA_INICIAL}        datepicker1
${VOLTAR_MES}          //span[@class='ui-icon ui-icon-circle-triangle-w'][contains(.,'Prev')]
${SELECIONAR_DATA}    //a[@class='ui-state-default'][contains(.,'13')]
${DATA_INICIAL2}      datepicker2
${SELECIONAR_DATA2}   //a[contains(@class,'dp1684940400000')]

#slider
${SLIDER}            slider

*** Keywords ***

# Caso de teste 1 - Verificar datepicker
acesso à tela datepicker
    Go To            ${URL_DATEPICKER}
    Wait Until Element Is Visible    ${DATA_INICIAL}            timeout=3s

selecionar a data inical
    Click Element    ${DATA_INICIAL}
    Click Element    ${VOLTAR_MES}
    Click Element    ${SELECIONAR_DATA}

então, ao selecionar a data final, o teste é finalizado
    Click Element    ${DATA_INICIAL2}
    Click Element    ${SELECIONAR_DATA2}

