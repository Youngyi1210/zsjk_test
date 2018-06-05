*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Test Cases ***
testpost
    ${header}    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary    eid=1
    Create Session    login    http://127.0.0.1:8000
    ${r}=    Post Request    login    /login_action/    params=${payload}
    Should Be Equal As Strings    ${r.status_code}    200
    log    ${r.json()}
    ${dict}    Set variable    ${r.json()}
    #断言结果
    ${msg}    Get From Dictionary    ${dict}   message
    Should Be Equal    ${msg}    parameter error
    ${sta}    Get From Dictionary    ${dict}    status
    ${status}    Evaluate    int(10021)
    Should Be Equal    ${sta}    ${status}

