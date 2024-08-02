*** Settings ***
Documentation    Most of the test data used to simulate user inputs in the application goes here.

*** Variables ***
### --- Registration Page ---
${valid_uname_reg}    Fernando
${valid_sname_reg}    Garzon
${valid_phone_reg}    11912345678
${valid_test_pword_reg}    m$!p$@@wrd

${invalid_uname_reg}    F3rn4nd0
${invalid_sname_reg}    G4r30h
${invalid_phone_reg}    --phone-number--]
${invalid_email_reg}    mail@email
${invalid_test_pword_reg}    123456