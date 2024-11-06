*** Settings ***
Library    SeleniumLibrary
Resource    ../../../testdata/environment.robot

*** Variables ***
${accountNumber}    1111111111
${password}    1234
${firstName}    Kritsada
${lastName}    Hongsasurath

*** Keywords ***
Initialize System
    Open Browser    ${WEB_URL}    ${WEB_BROWSER} 
    Maximize Browser Window

Register Success
    Wait Until Element Contains    //*[@id="root"]/div/nav/div/a[2]    Register  
    Click Element    //*[@id="root"]/div/nav/div/a[2]
    Input text    //*[@id="accountId"]    ${accountNumber}
    Input Password    //*[@id="password"]    ${password} 
    Input text    //*[@id="firstName"]    ${firstName}
    Input text   //*[@id="lastName"]    ${lastName}
    Click Element    //*[@id="root"]/div/div/div/form/button
    