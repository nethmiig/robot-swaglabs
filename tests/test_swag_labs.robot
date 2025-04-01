*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${URL}    chrome    options=add_argument(--headless)
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://your_username.github.io/your_repo/swag_labs.html
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
E2E Purchase Flow

    [Documentation]    Full user flow: login, add to cart, checkout, and confirm

    # Login
    Input Text    id:username    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login-button
    Wait Until Element Is Visible    id:product-page    timeout=10s

    # Add items to cart
    Click Button    xpath=(//button[contains(text(),'Add to Cart')])[1]
    Click Button    xpath=(//button[contains(text(),'Add to Cart')])[2]

    # Go to checkout
    Click Element    xpath=//div[contains(@class,'cart-icon')]
    Wait Until Element Is Visible    id:checkout-page    timeout=10s

    # Remove one item
    Click Button    xpath=(//button[contains(text(),'Remove')])[1]

    # Fill out form
    Input Text    id:first-name    Nethmi
    Input Text    id:last-name    Gamage
    Input Text    id:postal-code    50100
    Click Button    xpath=//button[contains(text(),'Complete Purchase')]

    # Confirm message
    Wait Until Page Contains    Thank you for your purchase