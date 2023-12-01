*** Settings ***
Library         Collections
Library         OperatingSystem
Library         SeleniumLibrary

*** Variables ***
${URL}                   https://the-internet.herokuapp.com/windows
${CLICK_HERE}            //a[contains(.,'Click Here')]
${NEW_WINDOW}            //h3[contains(.,'New Window')]

*** Keywords ***

# Caso de teste 1 - Verificar várias janelas no navegador
Verificar várias janelas no navegador
    Go To    ${URL}
    Wait Until Element Is Visible      ${CLICK_HERE}      timeout=5

    Click Element  ${CLICK_HERE}
    Switch Window  locator=NEW    # Após clicar no link, fixa na nova janela aberta
  
    # Handle Lookup Window
    # Select Window    NEW      #comment: It will automatically move to new window
    # ${tempB}=    Get Title
    # Log To Console    New window is : \ ${tempB}    # to verify the name in console
    # Select Frame    //*[@title='Search']            # optional sometimes elements are within frames ,so first need to access frame
    # Input Text    id=lksrch    hello
    # Click Element    //*[@value=' Go! ']
    # Unselect Frame                                  # going back to page
    # Select Frame    //*[@title='Results']           #selecting another frame
    # Click Element    id=jobdone 
    # Select Window                                    #once the jobdone button is clicked my pop up browser window is automatically get closed.so going back to parent browser.