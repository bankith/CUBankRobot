*** Settings ***
Resource    ../../keywords/ui/common/cubankCommonKeywords.robot
Resource    ../../keywords/ui/common/bankCommonKeywords.robot
Test Setup     Run Keywords                 Initialize System And Login   AND
...             Deposit With Amount 100   AND
...             Withdraw With Amount 100
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot

*** Variables ***

*** Test Cases ***
TF_IV_01 Account Number Is Not Numbers Should Fail
    Given Set Transfer To A987654321 With Amount 100
    When Submit Transfer
    Then Transfer Error Message Should Be  Your account ID should contain numbers only.

TF_IV_02 Account Number Digit Is More Than 10 Should Fail
    Given Set Transfer To 09876543211 With Amount 100
    When Submit Transfer
    Then Transfer Error Message Should Be  Your account ID must be exactly 10 digits long.
    
TF_IV_03 Account Number Digit Is Less Than 10 Should Fail
    Given Set Transfer To 987654321 With Amount 100
    When Submit Transfer
    Then Transfer Error Message Should Be  Your account ID must be exactly 10 digits long.

TF_IV_04 Transfer To Unexisting Account Should Fail
    Given Set Transfer To 5555555555 With Amount 100
    When Submit Transfer
    Then Transfer Error Message Should Be  We couldn't find the recipient's account. Please double-check the account ID.

TF_IV_05 Transfer To Your Own Account Should Fail
    Given Set Transfer To ${test_data_account_number} With Amount 100
    When Submit Transfer
    Then Transfer Error Message Should Be  You cannot transfer to your own account.

TF_IV_06 Transfer Amount Is Not Numbers Should Fail
    Given Set Transfer To ${test_data_account_number_2} With Amount ABC
    When Submit Transfer
    Then Transfer Error Message Should Be  Invalid balance amount. Please enter a valid number

TF_IV_07 Transfer Amount Is Decimals Should Fail
    Given Set Transfer To ${test_data_account_number_2} With Amount 100.5
    When Submit Transfer
    Then Transfer Error Message Should Be  The balance amount must be a whole number with no decimals

TF_IV_08 Transfer Amount Is Zero Should Fail
    Given Set Transfer To ${test_data_account_number_2} With Amount 0
    When Submit Transfer
    Then Transfer Error Message Should Be  The amount must be greater than 0. Please enter a positive number.

TF_IV_09 Transfer With Amount More Than Current Balance Should Fail
    Given Check Current Balance 
    AND Set Transfer To ${test_data_account_number_2} With Amount ${${BALANCE_ORIGINAL}+${1}}
    When Submit Transfer
    Then Transfer Error Message Should Be  Your balance is not enough to complete the transfer.

*** Keywords ***
Set Transfer To ${to} With Amount ${amount}
    Sleep  ${0.5}
    Input Text  //*[@id="root"]/div/div/div/div[5]/div[2]/form/div[1]/label/input  ${to}
    Input Text  //*[@id="root"]/div/div/div/div[5]/div[2]/form/div[2]/label/input  ${amount}

Transfer Error Message Should Be
    [Arguments]     ${err_message}
    ${err}   Get Text   //*[@id="root"]/div/div/div/div[5]/div[2]/form/div[3]/label
    Should Be Equal  ${err}  ${err_message} 