*** Settings ***
Library    AppiumLibrary
Resource   ../common/KeywordsFile.robot
Library    String
Test Setup  Open app
Test Teardown   Close app

*** Test Cases ***
Test Wiki app
    Test connection
    Validate output

*** Keywords ***
Open app
    Open Application    http://127.0.0.1:4723/wd/hub  
    ...  automationName=XCUITest
    ...  platformName=ios  
    ...  platformVersion=16.0 
    ...  app=apps/LocalSample.ipa
    IMPLICIT WAIT    5

Test connection
    click element    id=TestBrowserStackLocal

Validate output
    ${output}=      get text    id=ResultBrowserStackLocal
    Should Be True    "${output}"=="Response is: Up and running"