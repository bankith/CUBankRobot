*** Settings ***
Library    SeleniumLibrary
Resource    ../../../testdata/environment.robot
Resource    ../../../testdata/test_data.robot

*** Variables ***
${BALANCE_ORIGINAL}     ${0}
${PAY_BILL_AMOUNT}    ${1}

*** Keywords ***
Click Water Bill
    Click Element   //*[@id="root"]/div/div/div/div[6]/div[2]/form/div[1]/input[1]

Click Electric Bill
    Click Element   //*[@id="root"]/div/div/div/div[6]/div[2]/form/div[1]/input[2]

Click Mobile Bill
    Click Element   //*[@id="root"]/div/div/div/div[6]/div[2]/form/div[1]/input[3]

Set Bill Paying Amount
    [Arguments]     ${bill_amount}
    Input text    //*[@id="root"]/div/div/div/div[6]/div[2]/form/div[2]/label/input    ${bill_amount}
    

Submit Pay Bill    
    ${balance}   Get Text    //*[@id="root"]/div/div/div/div[2]/article/h1[3]    
    Set Suite Variable   ${BALANCE_ORIGINAL}   ${balance}
    Click Element  //*[@id="root"]/div/div/div/div[6]/div[2]/form/button

Balance Will Be Decreased
    sleep    ${1} 
    ${balance}    Get Text    //*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Should Be Equal  ${${BALANCE_ORIGINAL} - ${PAY_BILL_AMOUNT}}   ${${balance}}



Check Current Balance
    ${balance}   Get Text    //*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Set Suite Variable   ${BALANCE_ORIGINAL}   ${balance}