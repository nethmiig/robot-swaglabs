*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}        Chrome
${URL}            ${URL}    https://nethmiig.github.io/robot-swaglabs/swag_labs.html

${USERNAME}       standard_user
${PASSWORD}       secret_sauce

*** Test Cases ***
End-to-End Purchase Flow
    [Documentation]    Full purchase flow: Login > Add to cart > Checkout > Confirm order

    Login To Application
    Add Items To Cart
    Go To Checkout And Remove One Item
    Fill Checkout Form And Finalize
    Verify Confirmation Page

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}    options=add_argument:--headless

    Maximize Browser Window
    Wait Until Element Is Visible    id=username    timeout=10s

Login To Application
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Element Is Visible    id=products-grid    timeout=10s

Add Items To Cart
    Click Button    xpath=(//button[contains(text(),'Add to Cart')])[1]
    Click Button    xpath=(//button[contains(text(),'Add to Cart')])[2]
    Click Element   xpath=//div[contains(@class, 'cart-icon')]

Go To Checkout And Remove One Item
    Wait Until Element Is Visible    id=checkout-page
    Click Button    xpath=(//button[contains(text(),'Remove')])[1]

Fill Checkout Form And Finalize
    Input Text    id=first-name    Nexhmi
    Input Text    id=last-name     Damage
    Input Text    id=postal-code   50100
    Click Button    xpath=//button[contains(text(),'Complete Purchase')]

Verify Confirmation Page
    Wait Until Element Is Visible    id=confirmation-page
    Page Should Contain Element      xpath=//h2[contains(text(),'Thank You For Your Order!')]
