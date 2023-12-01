*** Settings ***
Library         Collections
Library         OperatingSystem
Library         SeleniumLibrary

*** Variables ***
${URL}                  https://demoqa.com/frames
${FRAME}                frame1
${TEXT}                 sampleHeading
*** Keywords ***

# Caso de teste 1 - Caso de teste 1 - Verificar iframes

Verificar iframe simples
    Open Browser      ${URL}    firefox
    Sleep    5s
    Select Frame      ${FRAME}
    Click Element     ${TEXT} 
    Element Text Should Be      ${TEXT}   This is a sample page
    Close Browser  