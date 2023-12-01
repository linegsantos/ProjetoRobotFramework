*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem

*** Variables ***
#URL'S
${URL_CADASTRO}              https://demo.automationtesting.in/Register.html

# CAMPOS A LOCALIZAR
${TITULO}                    //h2[contains(.,'Register')]
${FIRSTNAME}                 //input[contains(@placeholder,'First Name')]
${LASTNAME}                  //input[contains(@placeholder,'Last Name')]  
${ADDRESS}                   //textarea[contains(@rows,'3')]   
${EMAIL}                     //input[contains(@type,'email')]
${PHONE}                     //input[contains(@type,'tel')]
${FEMALE}                   //input[contains(@value,'FeMale')]
${MOVIES}                   //input[contains(@value,'Movies')]
${SKILLS}                   Skills
${API}                      //option[@value='APIs'][contains(.,'APIs')]
${IMAGE}                    //input[contains(@type,'file')]
${PROCURAR}                 imagesrc
${FILE}                     C:\\Users\\aline.goncalves\\Downloads\\bugs.jpg
${SALVAR}                   submitbtn

*** Keywords ***

### Caso de teste 1 - Realizar cadastro

acesso ao sistema
    Go To         ${URL_CADASTRO}   
    Wait Until Element Is Visible        ${TITULO}

preencher os dados
    Input Text    ${FIRSTNAME}          Teste 
    Input Text    ${LASTNAME}           1 
    Input Text    ${ADDRESS}            Rua 1
    Input Text    ${EMAIL}              teste@teste.com
    Input Text    ${PHONE}              1111111111
    Wait Until Element Is Visible       ${FEMALE}
   
    Click Element                       ${FEMALE}

    Select Checkbox                     ${MOVIES}
    Checkbox Should Be Selected         ${MOVIES}
    Wait Until Element Is Visible       ${SKILLS}

   execute javascript  window.scrollTo(0,200)
   Scroll Element Into View             ${SKILLS}
   Click Element  ${SKILLS}
   Wait Until Element Is Visible        ${API}        timeout=3s
   Click Element  ${API}

selecionar o arquivo
    Wait Until Element Is Visible       ${IMAGE}      timeout=5s
    Choose File  ${IMAGE}               ${FILE}

então o cadastro será salvo
    execute javascript  window.scrollTo(0,2000)
    Scroll Element Into View            ${SALVAR}
    Click Button                        ${SALVAR} 
   