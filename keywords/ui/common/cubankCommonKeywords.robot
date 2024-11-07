*** Settings ***
Library    SeleniumLibrary
Resource    ../../../testdata/environment.robot
Resource    ../../../testdata/test_data.robot

*** Keywords ***
Initialize System
    Open Browser    ${WEB_URL}    ${WEB_BROWSER} 
    Maximize Browser Window

Initialize System And Login
    Initialize System
    Given Input Username And Password  ${test_data_account_number}  ${test_data_password}
    When Submit Login
    Then Enter Account Page

Set UserName And Password
    [Arguments]     ${username}   ${password}
    Set Suite Variable  ${USERNAME}  ${username}
    Set Suite Variable  ${PASSWORD}  ${password}    

Input Username And Password
    [Arguments]     ${username}   ${password}
    Input text    //*[@id="accountId"]    ${username}
    Input text    //*[@id="password"]     ${password}

Submit Login        
    Click Element  //*[@id="root"]/div/div/div/form/button
    
Enter Account Page  
    Wait Until Element Contains     //*[@id="root"]/div/div/div/div[2]/article/h2[1]    Account

Deposit With Amount ${amount}
    Input text       //*[@id="root"]/div/div/div/div[3]/div[2]/form/label/input    ${amount}
    Click Button    //*[@id="root"]/div/div/div/div[3]/div[2]/form/button

Withdraw With Amount ${amount}
    Input text       //*[@id="root"]/div/div/div/div[4]/div[2]/form/label/input    ${amount}
    Click Element    //*[@id="root"]/div/div/div/div[4]/div[2]/form/button

    