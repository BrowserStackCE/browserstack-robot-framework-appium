*** Settings ***
Library    AppiumLibrary
Resource   ../../common/KeywordsFile.robot

*** Variables ***
${APP_ID}=     %{BROWSERSTACK_APP_ID}

*** Test Cases ***
Test Wiki app
    Open app
    click on text button
    enter text
    validate result
    Close app

*** Keywords ***
Open app
    open application    app=${APP_ID}   remote_url=${REMOTE_URL}    device=iPhone 12    os_version=14   name=parallel_test_iphone12   build=browserstack-robot-framework
    IMPLICIT WAIT    5
