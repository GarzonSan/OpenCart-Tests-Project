*** Settings ***
Documentation    WIP -- Main Test Suite For the OpenCart Application --
Resource    ../PO/generics.robot
Resource    ../PO/registrationPage.robot
Resource    ../PO/loginPage.robot
Suite Setup    generics.Open Session
Suite Teardown    generics.End Session

*** Test Cases ***
# === REGISTRATION PAGE SCENARIOS === #
User Can Register New Accounts
    # PRE CONDITION
    [Setup]    generics.Open URL to Page    ${registration_url}
    # TEST SCENARIO
    registrationPage.Input Valid Data in the Required Fields
    registrationPage.Accept the Privacy Policy
    registrationPage.Submit the Registration Form
    registrationPage.Can Succesfully Access the Account Page
    registrationPage.Logoff Current User Account

Registration Form Only Accepts Valid Data
    # PRE CONDITION
    [Setup]    generics.Open URL to Page    ${registration_url}
    # TEST SCENARIO
    registrationPage.Input Invalid Data in the Required Fields
    registrationPage.Accept the Privacy Policy
    registrationPage.Submit the Registration Form
    registrationPage.Errors Were Raised as Expected

Privacy Policy is Succesfully Shown During Registration Process
    # PRE CONDITION
    [Setup]    generics.Open URL to Page    ${registration_url}
    # TEST SCENARIO
    Log    Clicking on Privacy Policy Link
    Click Element    ${privacy_policy_link_locator}
    registrationPage.Privacy Policy Window Is Being Displayed

# === LOGIN PAGE SCENARIOS === #
User Can Access Their Newly Created Account
    # PRE CONDITION
    [Setup]    generics.Open URL to Page    ${login_page_url}
    # TEST SCENARIO
    loginPage.Input The Recently Created Account Credentials And Submit The Form
    loginPage.Check If The Account Page Is Displayed Succesfully

The Login Page Only Accepts Valid Registered Account Data For LogIn
    # PRE CONDITION
    [Setup]    generics.Open URL to Page    ${login_page_url}
    # TEST SCENARION
    loginPage.Input Unmatching Account Credentials And Submit The Form
    loginPage.Verify If An Error Was Succesfully Raised