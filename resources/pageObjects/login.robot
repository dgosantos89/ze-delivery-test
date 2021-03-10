*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${EMAIL}
${PASS}
${LOGIN_URL}        https://www.ze.delivery/conta/entrar
${EMAIL_INPUT}      id=login-mail-input-email
${PASS_INPUT}       id=login-mail-input-password
${SIGNIN_BTN}       id=login-mail-button-sign-in

*** Keywords ***
that the user is logged in
    Go To       ${LOGIN_URL}
    Wait Until Element Is Visible    ${EMAIL_INPUT}
    Input Text  ${EMAIL_INPUT}  ${EMAIL}
    Input Text  ${PASS_INPUT}   ${PASS}
    Click Element   ${SIGNIN_BTN}
