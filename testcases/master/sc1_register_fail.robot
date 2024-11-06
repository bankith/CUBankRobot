*** Settings ***
Resource    ../../keywords/ui/common/opalCommonKeywords.robot
Suite Setup    Initialize System

*** Variables ***
${accountNumber}    1234567890
${password}    1234
${firstName}    Kritsada
${lastName}    Hongsasurath

*** Test Cases ***
SC_1_1_Account_Number_Not_Integer
    Wait Until Element Contains    //*[@id="root"]/div/nav/div/a[2]    Register  
    Click Element    //*[@id="root"]/div/nav/div/a[2]
    Input text    //*[@id="accountId"]    123456789X
    Input Password    //*[@id="password"]    ${password} 
    Input text    //*[@id="firstName"]    ${firstName}
    Input text   //*[@id="lastName"]    ${lastName}
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/div/label    Your account ID should contain numbers only.

SC_1_2_Account_Number_Digits_Grater_Than_10
    Input text    //*[@id="accountId"]    12345678901
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/div/label    Your account ID must be exactly 10 digits long.

SC_1_3_Account_Number_Digits_Less_Than_10
    Input text    //*[@id="accountId"]    123456789
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/div/label    Your account ID must be exactly 10 digits long.

SC_1_4_Account_Number_Already_In_System
    Input text    //*[@id="accountId"]    1111111111
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/div/label    This account ID is already in use. Please choose another.

SC_1_5_Password_Not_Integer
    Input text    //*[@id="accountId"]    ${accountNumber}
    Input Password    //*[@id="password"]    ABCD
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/div/label    Your password should contain numbers only.

SC_1_6_Password_Digits_Grater_Than_4
    Input Password    //*[@id="password"]    12345
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/div/label    Your password must be exactly 4 digits long.

SC_1_7_Password_Digits_Less_Than_4
    Input Password    //*[@id="password"]    123
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/div/label    Your password must be exactly 4 digits long.

SC_1_8_FullName_Char_Grater_Than_30
    Input Password    //*[@id="password"]    1234
    Input text    //*[@id="firstName"]    Kritsadaaaaaaa
    Input text   //*[@id="lastName"]    Hongsasurathhhhhhhh
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/div/label    Your fullname must be 30 characters or less, including spaces.

SC_1_9_FullName_Char_Empty
    Input Password    //*[@id="password"]    1234
    Clear Element Text    //*[@id="firstName"]    
    Clear Element Text   //*[@id="lastName"]
    Click Element    //*[@id="root"]/div/div/div/form/button
    Element Text Should Be    //*[@id="root"]/div/div/div/form/div/label    Your fullname must be 30 characters or less, including spaces.

Close Browser
    Sleep    2
    Close Browser