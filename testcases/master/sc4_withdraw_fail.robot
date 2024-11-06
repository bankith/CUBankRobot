*** Settings ***
Resource    ../../keywords/ui/common/opalCommonKeywords.robot
Suite Setup    Initialize System

*** Variables ***

*** Test Cases ***
Initial
    Login Success
    Deposit Success

# SC_4_1_Amount_Withdrawal_Not_Number

SC_4_2_Amount_Withdrawal_Not_Integer
    Input text    xpath=/html/body/div/div/div/div/div[4]/div[2]/form/label/input   50.5
    Click Element    //*[@id="root"]/div/div/div/div[4]/div[2]/form/button 
    Element Text Should Be    //*[@id="root"]/div/div/div/div[4]/div[2]/form/div/label    The balance amount must be a whole number with no decimals.

SC_4_3_Amount_Withdrawal_AmountWithdraw_Less_Than_Or_Equal_0
    Input text    xpath=/html/body/div/div/div/div/div[4]/div[2]/form/label/input     0
    Click Element    //*[@id="root"]/div/div/div/div[4]/div[2]/form/button 
    Element Text Should Be    //*[@id="root"]/div/div/div/div[4]/div[2]/form/div/label    The amount must be greater than 0. Please enter a positive number.

SC_4_4_Amount_Withdrawal_AmountWithdraw_Grater_Than_Balance
    Input text   xpath=/html/body/div/div/div/div/div[4]/div[2]/form/label/input     99999999999
    Click Element    //*[@id="root"]/div/div/div/div[4]/div[2]/form/button 
    Element Text Should Be    //*[@id="root"]/div/div/div/div[4]/div[2]/form/div/label    Your balance is not enough to complete the withdrawal.

Close Browser
    Sleep    2
    Close Browser 
