*** Settings ***
Library    AppiumLibrary
Library    String
Resource   ../common/KeywordsFile.robot
Test Setup  Open app
Test Teardown   Close app

*** Test Cases ***
Test Wiki app
    Search for keyword browserstack in wiki app
    Validate search test

*** Keywords ***
Open app
    Open Application    http://127.0.0.1:4723/wd/hub  
    ...  automationName=UIAutomator2
    ...  platformName=Android  
    ...  platformVersion=12.0
    ...  app=apps/WikipediaSample.apk
    IMPLICIT WAIT    5