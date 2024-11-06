*** Settings ***
Resource    ../../keywords/ui/common/opalCommonKeywords.robot
Suite Setup    Initialize System

*** Variables ***

*** Test Cases ***
# SC_3_1_Amount_Deposit_Not_Integer
#     Login Success
#     Element Should Not Contain    //*[@id="root"]/div/nav/div/a[1]    LOGIN  
#     Element Should Not Contain    //*[@id="root"]/div/nav/div/a[2]    Register  
#     Element Should Contain    //*[@id="root"]/div/nav/div/a[2]    LOG OUT  

SC_3_2_Amount_Deposit_Less_Than_Or_Equal_0
    Login Success
    Element Should Not Contain    //*[@id="root"]/div/nav/div/a[1]    LOGIN  
    Element Should Not Contain    //*[@id="root"]/div/nav/div/a[2]    Register  
    Element Should Contain    //*[@id="root"]/div/nav/div/a[2]    LOG OUT
    Input text    //*[@id="amount"]    0
    Click Element    //*[@id="root"]/div/div/div/div[3]/div[2]/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/div[3]/div[2]/form/div/label    The amount must be greater than 0. Please enter a positive number.
    
Close Browser
    Sleep    2
    Close Browser  