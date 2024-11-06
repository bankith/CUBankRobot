*** Settings ***
Resource    ../../keywords/ui/common/cubankCommonKeywords.robot
Resource   ../../keywords/ui/common/bankCommonKeywords.robot

Suite Setup           Initialize System And Login
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot


*** Test Cases ***
BP_VD_01 Paying Bill With Selecting Water Option Should Succeed
    Given Click Water Bill 
    AND Set Bill Paying Amount  ${PAY_BILL_AMOUNT}
    When Submit Pay Bill
    Then Balance Will Be Decreased

BP_VD_02 Paying Bill With Selecting Electric Option Should Succeed
    Given Click Electric Bill 
    AND Set Bill Paying Amount  ${PAY_BILL_AMOUNT}
    When Submit Pay Bill
    Then Balance Will Be Decreased

BP_VD_03 Paying Bill With Selecting Mobile Option Should Succeed
    Given Click Mobile Bill 
    AND Set Bill Paying Amount  ${PAY_BILL_AMOUNT}
    When Submit Pay Bill
    Then Balance Will Be Decreased

