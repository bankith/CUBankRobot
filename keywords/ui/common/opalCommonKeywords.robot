*** Settings ***
Library    SeleniumLibrary
Resource    ../../../testdata/environment.robot
Resource    ../../../testdata/test_data.robot

*** Keywords ***


*** Keywords ***
Initialize System
    Open Browser    ${WEB_URL}    ${WEB_BROWSER} 
    Maximize Browser Window