*** Settings ***
Documentation    This file contains all keywords and variables that are used in multiple scripts
...              for easy access.
...              For some tests it might be needed to explicitly inform a new temporary email address,
...              and in these cases, the variable '$\{temp_email}' must be set in the terminal before
...              running the tests.
...              If a temp_email is not set, a random 1sec email will be used instead.
Library    SeleniumLibrary

*** Variables ***
${target_browser}    Chrome
${temp_email}    not_set
${base_app_url}    https://awesomeqa.com/ui/

*** Keywords ***
Open Session
    Open Browser    ${base_app_url}    ${target_browser}

End Session
    Delete All Cookies
    Close Browser

Open URL to Page
    [Arguments]    ${url_complement}
    Go To    ${base_app_url}${url_complement}
    Sleep    4