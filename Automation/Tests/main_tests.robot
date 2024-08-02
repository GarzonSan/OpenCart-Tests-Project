*** Settings ***
Documentation    WIP -- Main Test Suite For the OpenCart Application --
Resource    ../PO/generics.robot
Resource    ../PO/registrationPage.robot
Suite Setup    generics.Open Session
Suite Teardown    generics.End Session

*** Test Cases ***
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
