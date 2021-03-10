*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${SEARCH_INPUT}         id=search-product-input
${PRODUCT_LIST}         id=search-product-list
${ADD_BTN}              id=add-product
${UNAVAILABLE_P}        xpath=//*[@id="primary-modal-button"]/../../p
${UNAVAILABLE_TXT}      Não é possível entregar os produtos no mesmo pedido

*** Keywords ***
adding one "${PRODUCT}" to the bag
    Wait Until Element Is Visible    ${SEARCH_INPUT}
    Click Element   ${SEARCH_INPUT}
    Input Text  ${SEARCH_INPUT}  ${PRODUCT}
    Wait Until Element Is Visible   ${PRODUCT_LIST}
    Click Element   ${PRODUCT_LIST}
    Wait Until Element Is Visible   ${ADD_BTN}
    Click Element   ${ADD_BTN}

have a "${PRODUCT}" in the bag
    Wait Until Element Is Visible    ${SEARCH_INPUT}
    Click Element   ${SEARCH_INPUT}
    Input Text  ${SEARCH_INPUT}  ${PRODUCT}
    Wait Until Element Is Visible   ${PRODUCT_LIST}
    Click Element   ${PRODUCT_LIST}
    Wait Until Element Is Visible   ${ADD_BTN}
    Click Element   ${ADD_BTN}

the message product unavailable is displayed
    Wait Until Element Is Visible   ${UNAVAILABLE_P}
    Element Text Should Be   ${UNAVAILABLE_P}   ${UNAVAILABLE_TXT} 
