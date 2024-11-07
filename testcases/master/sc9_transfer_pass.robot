*** Settings ***
Resource    ../../keywords/ui/common/cubankCommonKeywords.robot
Resource   ../../keywords/ui/common/bankCommonKeywords.robot
Suite Setup     Run Keywords     
...             Initialize System And Login   
# ...             AND Deposit With 100
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot

*** Variables ***

*** Test Cases ***
TF_VD_01 
    Given Set Transfer To ${test_data_account_number_2} With Amount 1
    When Submit Transfer
    Then Balance Will Be Decreased By 1
    

*** Keywords ***
Set Transfer To ${to} With Amount ${amount}
    Input Text  //*[@id="accountId"]  ${to}
    Input Text  //*[@id="root"]/div/div/div/div[5]/div[2]/form/div[2]/label/input  ${amount}