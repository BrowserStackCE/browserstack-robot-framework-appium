*** Settings ***
Library    AppiumLibrary
Library    implicit-wait.py
Library    mark-test-status.py

*** Keywords ***
#Common test keywords
Close app
    close application

Add Implicit Wait
    [Arguments]    ${duration}
    IMPLICIT WAIT   ${duration}

#Android test keywords
Search for keyword browserstack in wiki app
    click element    id=org.wikipedia.alpha:id/search_container
    click element    id=org.wikipedia.alpha:id/search_src_text
    input text  id=org.wikipedia.alpha:id/search_src_text  BrowserStack

Search for keyword google in wiki app
    click element    id=org.wikipedia.alpha:id/search_container
    click element    id=org.wikipedia.alpha:id/search_src_text
    input text  id=org.wikipedia.alpha:id/search_src_text  Google

Validate search test
    ${length}=      get length    xpath=//android.widget.TextView
    Should Be True     ${length}>0

#iOS test keywords
Click on Text Button
    Click Element    id=Text Button

Enter Text
    Click Element    id=Text Input
    Input Text    id=Text Input    hello@browserstack \n

Validate result
    ${output}=  get text    id=Text Output
    Should Be True    "${output}"=="hello@browserstack "

