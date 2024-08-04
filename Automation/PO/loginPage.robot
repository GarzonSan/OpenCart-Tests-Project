*** Settings ***
Documentation    This file contains all Login Page related keywords / routines.
Library    SeleniumLibrary
Library    ../Resources/Custom Libraries/UserData.py
Resource    generics.robot
Resource    ../Resources/testData.robot
Resource    registrationPage.robot


*** Variables ***
${login_page_url}    index.php?route=account/login

# locators
${login_email_field}    id:input-email
${login_passwd_field}    id:input-password
${login_submit_button}    xpath://form//input[@type='submit' and @value='Login']
${login_failed_error_message}    xpath://div/div[contains(@class,'alert')]


*** Keywords ***
Input The Recently Created Account Credentials And Submit The Form
    ${last_email}=    Get Most Recent Generated Email
    Log    The last email is: ${last_email}
    Input Text    ${login_email_field}    ${last_email}
    Input Text    ${login_passwd_field}    ${valid_test_pword_reg}
    Click Element    ${login_submit_button}

Check If The Account Page Is Displayed Succesfully
    Wait Until Element Is Visible    ${account_info_verifier}
    registrationPage.Logoff Current User Account

Input Unmatching Account Credentials And Submit The Form
    ${last_email}=    Get Most Recent Generated Email
    Input Text    ${login_email_field}    ${last_email}
    Input Text    ${login_passwd_field}    ${invalid_test_pword_reg}
    Click Element    ${login_submit_button}

Verify If An Error Was Succesfully Raised
    Wait Until Element Is Visible    ${login_failed_error_message}
    registrationPage.Logoff Current User Account
