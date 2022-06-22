*** Settings ***
Library    AppiumLibrary
Resource   ../common/KeywordsFile.robot
Library    String

*** Variables ***
${APP_ID}=     %{BROWSERSTACK_APP_ID}

*** Test Cases ***
Test Wiki app
    Start Local testing
    Open app
    Test connection
    Validate output
    Close app
    Stop Local testing

*** Keywords ***
Open app
    open application    app=${APP_ID}   remote_url=${REMOTE_URL}    device=iPhone 12    os_version=14   name=local_test   build=browserstack-robot-framework    browserstack.local=true     autoGrantPermissions=true
    IMPLICIT WAIT    5

Test connection
    click element    id=TestBrowserStackLocal

Validate output
    ${output}=      get text    id=ResultBrowserStackLocal
    run keyword and return if    "${output}"=="Response is: Up and running"   mark test status    passed  Test passed!
    run keyword and return    mark test status    failed   Test failed!