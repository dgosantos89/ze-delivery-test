*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_URL}                     https://www.ze.delivery
${AGE_BTN_YES}                  id=age-gate-button-yes
${FAKE_ADDRESS_INPUT}           id=fake-address-search-input
${ADDRESS_INPUT}                id=address-search-input-address
${AUTO_COMPLETE_ADDRESS}        id=auto-complete-address Rua Fradique Coutinho, 1632 Pinheiros, São Paulo - SP, Brasil
${WITHOUT_COMPLEMENT_INPUT}     id=address-details-checkbox-without-complement
${ADDRESS_DETAILS_BTN}          id=address-details-button-continue

*** Keywords ***
that the user have entered the address "${ADDRESS}"
    Go To       ${HOME_URL}
    Wait Until Element Is Visible    ${AGE_BTN_YES}
    Click Element   ${AGE_BTN_YES}
    Click Element   ${FAKE_ADDRESS_INPUT}
    Input Text  ${ADDRESS_INPUT}    ${ADDRESS}
    Wait Until Element Is Visible   ${AUTO_COMPLETE_ADDRESS}
    Click Element   ${AUTO_COMPLETE_ADDRESS}
    Wait Until Element Is Visible   ${WITHOUT_COMPLEMENT_INPUT}
    Click Element   ${WITHOUT_COMPLEMENT_INPUT}
    Click Element   ${ADDRESS_DETAILS_BTN}