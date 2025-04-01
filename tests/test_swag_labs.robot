*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Chrome Headless
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://nethmiig.github.io/robot-swaglabs/swag_labs.html
${USERNAME}       standard_user
${PASSWORD}       secret_sauce

*** Test Cases ***
E2E Swag Labs Purchase Flow
    [Documentation]    Full flow: login → add items → checkout → remove item → confirm order.

    Log In To SwagLabs
    Add Items To Cart
    Proceed To Checkout And Remove One Item
    Fill Out Form And Finalize Purchase
    Confirm Success Message

*** Keywords ***
Open Chrome Headless
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window
    Wait Until Element Is Visible    id=username    timeout=10s

Log In To SwagLabs
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button
    Wait Until Element Is Visible    id=products-grid    timeout=10s

Add Items To Cart
    Click Button    xpath=(//button[contains(text(),"Add to Cart")])[1]
    Click Button    xpath=(//button[contains(text(),"Add to Cart")])[2]
    Click Element   xpath=//div[@class="cart-icon"]

Proceed To Checkout And Remove One Item
    Wait Until Element Is Visible    id=checkout-page
    Click Button    xpath=(//button[contains(text(),"Remove")])[1]

Fill Out Form And Finalize Purchase
    Input Text    id=first-name    Nethmi
    Input Text    id=last-name     Gamage
    Input Text    id=postal-code   50100
    Click Button  xpath=//button[contains(text(),"Complete Purchase")]

Confirm Success Message
    Wait Until Element Is Visible    id=confirmation-page
    Page Should Contain Element      xpath=//h2[contains(text(),"Thank You For Your Order!")]
