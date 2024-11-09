*** Settings ***
Resource    ../../keywords/ui/common/cubankCommonKeywords.robot
Suite Setup           Initialize System And Login

*** Variables ***
${BALANCE_ORIGINAL}     ${0}
${DEPOSIT_AMOUNT}    ${1}

*** Test Cases ***
TC_xx_Deposit_001 Deposit With Positive Number
    Given Set Deposit Amount   ${DEPOSIT_AMOUNT}
    When Submit Deposit Transaction
    Then Balance Will Be Increased



*** Keywords ***
Set Deposit Amount
    [Arguments]     ${deposit_amount}
    Input text    //*[@id="amount"]    ${deposit_amount}
    

Submit Deposit Transaction
    sleep    ${1} 
    ${balance}   Get Text    //*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Set Suite Variable   ${BALANCE_ORIGINAL}   ${balance}
    Click Element  //*[@id="root"]/div/div/div/div[3]/div[2]/form/button

Balance Will Be Increased
    sleep    ${1} 
    ${balance}    Get Text    //*[@id="root"]/div/div/div/div[2]/article/h1[3]
    Should Be Equal  ${${BALANCE_ORIGINAL} + ${DEPOSIT_AMOUNT}}   ${${balance}}