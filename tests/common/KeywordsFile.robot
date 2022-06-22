*** Settings ***
Library    AppiumLibrary
Library    implicit-wait.py
Library    mark-test-status.py
Library    manage-local-testing.py

*** Variables ***
${USERNAME}=     %{BROWSERSTACK_USERNAME}
${ACCESSKEY}=    %{BROWSERSTACK_ACCESS_KEY}
${REMOTE_URL}=  https://${USERNAME}:${ACCESSKEY}@hub-cloud.browserstack.com/wd/hub


*** Keywords ***
#Common test keywords
Close app
    close application

Add Implicit Wait
    [Arguments]    ${duration}
    IMPLICIT WAIT   ${duration}

Mark Test Status
    [Arguments]    ${status}    ${reason}
    TEST STATUS    ${status}    ${reason}

Start Local testing
    START LOCAL

Stop Local testing
    STOP LOCAL

#Android test keywords
Search for keyword in wiki app
    click element    id=org.wikipedia.alpha:id/search_container
    click element    id=org.wikipedia.alpha:id/search_src_text
    input text  id=org.wikipedia.alpha:id/search_src_text  BrowserStack

Validate wiki test
    ${length}=      get length    xpath=//android.widget.TextView
    run keyword and return if    ${length}>0    mark test status    passed  Test results have been validated.
    run keyword and return    mark test status    failed    Something went wrong!

#iOS test keywords
Click on Text Button
    Click Element    id=Text Button

Enter Text
    Click Element    id=Text Input
    Input Text    id=Text Input    hello@browserstack \n

Validate result
    ${output}=  get text    id=Text Output
    run keyword and return if    "${output}"=="hello@browserstack "  mark test status    passed  Test results have been validated!
    run keyword and return    mark test status    failed  Something went wrong!

