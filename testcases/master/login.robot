*** Settings ***
Resource    ../../keywords/ui/common/cubankCommonKeywords.robot
Suite Setup           Initialize System

*** Variables ***

*** Test Cases ***
TC_01_Login_001 Login With Valid Credentials
    Given Input Username And Password  ${test_data_account_number}  ${test_data_password}
    When Submit Login
    Then Enter Account Page


