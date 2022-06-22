*** Settings ***
Library    AppiumLibrary
Resource   ../../common/KeywordsFile.robot

*** Variables ***
${APP_ID}=     %{BROWSERSTACK_APP_ID}

*** Test Cases ***
Test Wiki app
    Open app
    Search for keyword in wiki app
    Validate wiki test
    Close app

*** Keywords ***
Open app
    open application    app=${APP_ID}   remote_url=${REMOTE_URL}    device=Samsung Galaxy S21 Plus  os_version=11.0   name=parallel_test_samsung   build=browserstack-robot-framework
    IMPLICIT WAIT    5