*** Settings ***
Library    AppiumLibrary
Resource   ../common/KeywordsFile.robot
Test Setup  Open app
Test Teardown   Close app

*** Test Cases ***
Test Sample app 1
    click on text button
    enter text 1
    validate result 1
Test Sample app 2
    click on text button
    enter text 2
    validate result 2

*** Keywords ***
Open app
    Open Application    http://127.0.0.1:4723/wd/hub  
    ...  automationName=XCUITest
    ...  platformName=ios  
    ...  platformVersion=16.0 
    ...  app=apps/BStackSampleApp.ipa
    IMPLICIT WAIT    5