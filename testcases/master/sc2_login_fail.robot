*** Settings ***
Resource    ../../keywords/ui/common/opalCommonKeywords.robot
Suite Setup    Initialize System

*** Variables ***
${accountNumber}    1234567890
${password}    1234

*** Test Cases ***
SC_2_1_Account_Number_Not_Integer
    Wait Until Element Contains    //*[@id="root"]/div/div/div/h2    Login
    Input text    //*[@id="accountId"]    123456789X
    Input Password    //*[@id="password"]    ${password} 
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/label[2]/div/label    Your account ID should contain numbers only.

SC_2_2_Account_Number_Digits_Grater_Than_10
    Input text    //*[@id="accountId"]    12345678901
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/label[2]/div/label    Your account ID must be exactly 10 digits long.

SC_2_3_Account_Number_Digits_Less_Than_10
    Input text    //*[@id="accountId"]    123456789
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/label[2]/div/label    Your account ID must be exactly 10 digits long.

SC_2_4_Account_Number_Not_In_System
    Input text    //*[@id="accountId"]    9999999999
    Click Element    //*[@id="root"]/div/div/div/form/button
    Wait Until Element Contains    //*[@id="root"]/div/div/div/form/label[2]/div/label    User not found. Please check your account ID.    5s
    Element Text Should Be    //*[@id="root"]/div/div/div/form/label[2]/div/label   User not found. Please check your account ID.

SC_2_5_Password_Not_Integer
    Input text    //*[@id="accountId"]    ${accountNumber}
    Input Password    //*[@id="password"]    ABCD
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/label[2]/div/label    Your password should contain numbers only.

SC_2_6_Password_Digits_Grater_Than_4
    Input Password    //*[@id="password"]    12345
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/label[2]/div/label    Your password must be exactly 4 digits long.

SC_2_7_Password_Digits_Less_Than_4
    Input Password    //*[@id="password"]    123
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/label[2]/div/label    Your password must be exactly 4 digits long.

SC_2_8_Password_Incorrect
    Input text    //*[@id="accountId"]    1111111111
    Input Password    //*[@id="password"]    9999
    Click Element    //*[@id="root"]/div/div/div/form/button
    Wait Until Element Contains    //*[@id="root"]/div/div/div/form/label[2]/div/label    Incorrect password. Please try again.    5s
    Element Text Should Be    //*[@id="root"]/div/div/div/form/label[2]/div/label    Incorrect password. Please try again.

Close Browser
    Sleep    2
    Close Browser  