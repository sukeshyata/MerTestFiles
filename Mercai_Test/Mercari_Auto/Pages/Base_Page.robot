*** Settings ***
Resource          ../Libraries/Library.robot

*** Variables ***
${url}            https://jp.mercari.com/en
${browser}        chrome
${short_wait}     30    # in sec
${medium_wait}    60    # in Sec
${long_wait}      90

*** Keywords ***
Launch_Browser
    [Arguments]    ${validate_title}
    [Documentation]    This Keyword will open url and verify title
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    sleep    5
    Title Should Be    ${validate_title}
