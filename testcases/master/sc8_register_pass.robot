*** Settings ***
Resource    ../../keywords/ui/common/opalCommonKeywords.robot
Suite Setup    Initialize System

*** Variables ***

*** Test Cases ***
SC_8_1_Register_Success
    Register Success
    Alert Should Be Present    Registration successful!
    Wait Until Element Contains    //*[@id="root"]/div/div/div/h2    Login    5s
    Element Text Should Be    //*[@id="root"]/div/div/div/h2    Login

Close Browser
    Sleep    2
    Close Browser 