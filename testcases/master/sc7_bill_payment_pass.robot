*** Settings ***
Resource    ../../keywords/ui/common/cubankCommonKeywords.robot
Resource   ../../keywords/ui/common/bankCommonKeywords.robot
Test Setup     Run Keywords                 Initialize System And Login   AND
...            Sleep  ${0.5}
Test Teardown    Run Keywords  
...    Run Keyword If Test Failed  Capture Page Screenshot   AND
...    Close Browser

*** Test Cases ***
BP_VD_01 Paying Bill With Selecting Water Option Should Succeed
    Given Click Water Bill 
    AND Set Bill Paying Amount  ${PAY_BILL_AMOUNT}
    When Submit Pay Bill
    Then Balance Will Be Decreased By ${PAY_BILL_AMOUNT}

BP_VD_02 Paying Bill With Selecting Electric Option Should Succeed
    Given Click Electric Bill 
    AND Set Bill Paying Amount  ${PAY_BILL_AMOUNT}
    When Submit Pay Bill
    Then Balance Will Be Decreased By ${PAY_BILL_AMOUNT}

BP_VD_03 Paying Bill With Selecting Mobile Option Should Succeed
    Given Click Mobile Bill 
    AND Set Bill Paying Amount  ${PAY_BILL_AMOUNT}
    When Submit Pay Bill
    Then Balance Will Be Decreased By ${PAY_BILL_AMOUNT}

