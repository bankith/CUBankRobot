*** Settings ***
Resource    ../../keywords/ui/common/cubankCommonKeywords.robot
Resource    ../../keywords/ui/common/BankCommonKeywords.robot
Suite Setup           Initialize System And Login
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot

*** Variables ***
${BALANCE_ORIGINAL}     ${0}


*** Test Cases ***
BP_IV_04 Amount Payment Is ABC Should Fail
    Given Click Water Bill 
    AND Set Bill Paying Amount  ABC
    When Submit Pay Bill
    Then Bill Payment Error Message Should Be  Invalid balance amount. Please enter a valid number.
    # sleep  ${10}
    # Then Balance Will Be Decreased

BP_IV_05 Amount Payment Is Decimal Should Fail
    Given Click Mobile Bill 
    AND Set Bill Paying Amount  ${100.5}
    When Submit Pay Bill
    Then Bill Payment Error Message Should Be  The balance amount must be a whole number with no decimals.

BP_IV_06 Amount Payment Is Less Than One Should Fail
    Given Click Mobile Bill 
    AND Set Bill Paying Amount  ${0}
    When Submit Pay Bill
    Then Bill Payment Error Message Should Be  The amount must be greater than 0. Please enter a positive number. 

BP_IV_07 Amount Payment Is More Than Balance Should Fail
    Given Click Mobile Bill
    AND Check Current Balance
    AND Set Bill Paying Amount  ${${BALANCE_ORIGINAL}+1}
    When Submit Pay Bill
    Then Bill Payment Error Message Should Be  Your balance is not enough to complete the bill payment.

    
*** Keywords ***
Bill Payment Error Message Should Be
    [Arguments]     ${err_message}
    ${err}   Get Text   //*[@id="root"]/div/div/div/div[6]/div[2]/form/div[3]/label
    Should Be Equal  ${err}  ${err_message} 