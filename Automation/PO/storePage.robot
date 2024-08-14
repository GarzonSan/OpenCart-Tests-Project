*** Settings ***
Documentation    This file contains all Store Front Pages related keywords / routines.
Library    SeleniumLibrary
Resource    generics.robot

*** Variables ***
#    LOCATORS
${main_products_row}    xpath://div[contains(@class, 'product-layout')]
${main_cart_button}    xpath://button[ancestor::div[@id='cart']]
${store_directory_row}    xpath://ul[@class='breadcrumb' and ancestor::div[@id='product-category']]

${catg_page_items_display}    xpath://div[@class='product-thumb']
${catg_menu_items}    xpath://nav[@id='menu']/div/ul[@class='nav navbar-nav']/li

#    CONTROL
${is_in_catg_page}    False

*** Keywords ***
Check if Loaded Content is Correct
    ${store_bars}=    Get WebElements    ${store_directory_row}
    ${list_len}=    Get Length    ${store_bars}
    IF    ${list_len} > 0
        Log    Is in a product page.
        ${products}=    Get WebElements    ${catg_page_items_display}
        ${has_products}=    Get Length    ${products}
        IF    ${has_products} > 0
            Log    Product Page Has No Items
        END
        ${is_in_catg_page}=    Set Variable    True
    ELSE
        Log    Not in a product page.
        Element Should Not Be Visible    ${catg_page_items_display}
        ${is_in_catg_page}=    Set Variable    False
    END

Go to Another Page Using the Navbar
    [Documentation]    Page number can be: 4, 5, 6, 7
    [Arguments]    ${page_number}
    ${menu_items}=    Get WebElements    ${catg_menu_items}
    ${target_number}=    Evaluate    ${page_number} - 1
    Click Element    ${menu_items}[${target_number}]

