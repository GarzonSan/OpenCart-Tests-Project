*** Settings ***
Documentation    This file contains all Registration Page related keywords / routines.
Library    SeleniumLibrary
Library    ../Resources/Custom Libraries/UserData.py
Resource    generics.robot
Resource    ../Resources/testData.robot

*** Variables ***
${registration_url}    index.php?route=account/register
${registration_wrong_data_alert_locator}    xpath://div[@class='text-danger']

${privacy_policy_link_locator}    xpath://div[@class='buttons']/div/a[@class='agree']
${privacy_policy_window_locator}    //div[@id='modal-agree' and @class='modal in']

${account_page_url}    index.php?route=account/account
${account_info_verifier}    xpath://div[@id='content']/ul/li/a[contains(text(),'account information')]
${account_logout_url}    index.php?route=account/logout
${account_logoff_confirmation_text_locator}    xpath://div[@id='content']/p[contains(text(),'You have been logged off your account.')]

# --- Form Fields ---
${name_field}    xpath://form/fieldset[@id='account']/div/div/input[@name='firstname']
${sname_field}    xpath://form/fieldset[@id='account']/div/div/input[@name='lastname']
${email_field}    xpath://form/fieldset[@id='account']/div/div/input[@name='email']
${phone_field}    xpath://form/fieldset[@id='account']/div/div/input[@name='telephone']
${pw_field}    xpath://form/fieldset/div[@class='form-group required']/div/input[@name='password']
${pw_confirmation_field}    xpath://form/fieldset/div[@class='form-group required']/div/input[@name='confirm']
${privacy_policy_checkbox}    xpath://div[@class='buttons']/div/input[@name='agree']
${registration_submit_button}    xpath://div[@class='buttons']/div/input[@type='submit']

*** Keywords ***
Input Valid Data in the Required Fields
    # name field
    Input Text    ${name_field}    ${valid_uname_reg}
    # surname field
    Input Text    ${sname_field}    ${valid_sname_reg}
    # email field
    ${t_mail} =    Get New Temp Email
    Log    The temporary email generated for this account is ${t_mail}
    Input Text    ${email_field}    ${t_mail}
    # telephone field
    Input Text    ${phone_field}    ${valid_phone_reg}
    # password fields ---
    #     Password
    Input Text    ${pw_field}    ${valid_test_pword_reg}
    #     Verification Password
    Input Text    ${pw_confirmation_field}    ${valid_test_pword_reg}

Input Invalid Data in the Required Fields
    # name field
    Input Text    ${name_field}    ${invalid_uname_reg}
    # surname field
    Input Text    ${sname_field}    ${invalid_sname_reg}
    # email field
    Input Text    ${email_field}    ${invalid_email_reg}
    # telephone field
    Input Text    ${phone_field}    ${invalid_phone_reg}
    # password fields ---
    #     Password
    Input Text    ${pw_field}    ${invalid_test_pword_reg}
    #     Verification Password
    Input Text    ${pw_confirmation_field}    ${invalid_test_pword_reg}

Accept the Privacy Policy
    Element Should Be Visible    ${privacy_policy_checkbox}
    Click Element    ${privacy_policy_checkbox}

Submit the Registration Form
    Element Should Be Visible    ${registration_submit_button}
    Click Element    ${registration_submit_button}

Errors Were Raised as Expected
    Sleep    1
    @{alerts}=    Get WebElements    ${registration_wrong_data_alert_locator}
    ${list_lenght}=    Get Length    ${alerts}

    # Counting alerts to use in future checks
    ${alert_counter}=    Set Variable    0

    FOR    ${alert}    IN    @{alerts}
        ${alert_counter}=    Evaluate    '${alert_counter}+1'
    END

    IF    ${list_lenght}>=1
        Pass Execution    Errors were raised!
    ELSE
        Fail
    END

Can Succesfully Access the Account Page
    Go To    ${base_app_url}${account_page_url}
     Wait Until Element Is Visible    ${account_info_verifier}

Logoff Current User Account
    ${current_url}=    Get Location
    IF    "${current_url}"=="${base_app_url}${account_page_url}"
        Go To    ${base_app_url}${account_logout_url}
        Sleep    2
        Wait Until Element Is Visible    ${account_logoff_confirmation_text_locator}
    END

Privacy Policy Window Is Being Displayed
    Wait Until Element Is Visible    ${privacy_policy_window_locator}    timeout=6