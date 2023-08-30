*** Settings ***
Library    AppiumLibrary
Resource   ../common/KeywordsFile.robot
Library    String
Test Setup  Open app
Test Teardown   Close app

*** Test Cases ***
Test Local app
    Handle popup
    Test connection
    Validate output

*** Keywords ***
Open app
    Open Application    http://127.0.0.1:4723/wd/hub  
    ...  automationName=UIAutomator2
    ...  platformName=Android  
    ...  platformVersion=12.0
    ...  app=apps/LocalSample.apk
    IMPLICIT WAIT    5

Handle popup
    click element    id=android:id/button1

Test connection
    click element    id=com.example.android.basicnetworking:id/test_action

Validate output
    Sleep  5s
    ${output}=      get text    xpath=//android.widget.ScrollView//android.widget.TextView
    ${parsed_output}=    get lines containing string    ${output}    Up and running
    Should Be True    "${parsed_output}"!=""