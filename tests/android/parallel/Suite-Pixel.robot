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
    open application    app=${APP_ID}   remote_url=${REMOTE_URL}    device=Google Pixel 6   os_version=12.0   name=parallel_test_pixel   build=browserstack-robot-framework
    IMPLICIT WAIT    5