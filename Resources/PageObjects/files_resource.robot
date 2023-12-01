*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem
Library   FakerLibrary


*** Variables ***

#URLS
${URL_UPLOAD}        https://demo.automationtesting.in/FileUpload.html
${URL_DOWNLOADS}     https://demo.automationtesting.in/FileDownload.html

#BOTÕES
${BTN_BROWSE}        input-4
${BTN_UPLOAD}        //span[@class='hidden-xs'][contains(.,'Upload')]
${BTN_GENERATEFILE}  createTxt
${BTN_DOWNLOAD}      //a[@download='info.txt'][contains(.,'Download')]

#INPUTS
${TEXT}              textbox
${DROPDOWN}          /ins/span/svg/path

#FILES
${FILE}              C:\\Users\\aline.goncalves\\Downloads\\bugs.jpg

*** Keywords ***

# Caso de teste 1 -Verificar upload de arquivos
acesso à tela upload de arquivos
    Go To         ${URL_UPLOAD}
    Sleep         5s

clicar no botão Navegar
    Choose File  ${BTN_BROWSE}                           ${FILE}

então ao selecionar o arquivo, o teste é finalizado
    Wait Until Element Is Visible    ${BTN_UPLOAD}       timeout=5s

# Caso de teste 2 - Verificar download de arquivos

acesso à tela download de arquivos
    Go To       ${URL_DOWNLOADS}
    Sleep       5s
    
adicionar o texto
    ${TEXT_FAKE}       FakerLibrary.Texts

    Input Text  ${TEXT}            ${TEXT_FAKE}
    execute javascript  window.scrollTo(0,500)
    Scroll Element Into View       ${BTN_GENERATEFILE}

ao clicar em Download
    Click Button     ${BTN_GENERATEFILE} 

então o arquivo será baixado
    Click Element    ${BTN_DOWNLOAD}