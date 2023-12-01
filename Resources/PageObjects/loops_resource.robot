*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Variables ***
#URLS
${URL}            https://opensource-demo.orangehrmlive.com/

#Inputs
${USERNAME}       //input[contains(@name,'username')]
${PASSWORD}       //input[contains(@type,'password')]

#Texts
${DASHBOARD}      //h6[@class='oxd-text oxd-text--h6 oxd-topbar-header-breadcrumb-module'][contains(.,'Dashboard')]

#Buttons
${LOGIN_BTN}      //button[@type='submit'][contains(.,'Login')]

#Lists
@{quickLaunchList}  Assign Leave  Leave List  Timesheets  Apply Leave  My Leave  My Timesheet

*** Keywords ***

# Caso de teste 1 -Caso de teste 1 - Verificar loops if/else
acesso ao site
    Go To    ${URL}
    Wait Until Element Is Visible    ${LOGIN_BTN}    timeout=5

fazer o login
    Input Text        ${USERNAME}    Admin
    Input Password    ${PASSWORD}    admin123
    Click Button      ${LOGIN_BTN}
    # Element Should Be Visible    ${DASHBOARD}    timeout=5

então usando um loop For, os textos na seção Quick Launch são validados
    @{elementList}=  Get WebElements  css:div.quickLaunge
    @{textList}=    Create List
    FOR  ${element}  IN      @{elementList}
         ${text}=  Get Text  ${element}
         Append To List      ${textList}      ${text}
    END
    Log To Console  \n List from WebPage:
    Log To Console           ${textList}
    Log To Console  Our List:
    Log To Console           ${quickLaunchList}
