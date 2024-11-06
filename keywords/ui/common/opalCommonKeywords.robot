*** Settings ***
Library    SeleniumLibrary
Resource    ../../../testdata/environment.robot

*** Variables ***
${accountNumber}    1111111111
${password}    1234
${firstName}    Kritsada
${lastName}    Hongsasurath
${deposite}    100

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

Login Success
    Wait Until Element Contains    //*[@id="root"]/div/div/div/h2    Login 
    Input text    //*[@id="accountId"]    ${accountNumber}
    Input Password    //*[@id="password"]    ${password} 
    Click Element    //*[@id="root"]/div/div/div/form/button
    Wait Until Element Contains   //*[@id="root"]/div/div/div/div[2]/article/h2[1]    Account ID:    5s

Deposit Success
    Input text    xpath=/html/body/div/div/div/div/div[3]/div[2]/form/label/input    ${deposite}
    Click Element    //*[@id="root"]/div/div/div/div[3]/div[2]/form/button