*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${SUBTOTAL_TXT}         id=subtotal
${PROGRESS_BAR}         id=progress-bar
${FINISH_ORDER_BTN}     id=finish-order
${BAG_DIV}              id=pre-checkout
${CLOSE_BTN}            id=sidebar-header-close-button
${PLUS_BTN}             id=product-plus-button

*** Keywords ***
the subtotal must be "${SUBTOTAL_VALUE}"
    Wait Until Element Contains     ${SUBTOTAL_TXT}     ${SUBTOTAL_VALUE}

the minimum value message is displayed
    Element Should Be Visible       ${PROGRESS_BAR}

the finish order button is disabled
    Element Should Be Disabled      ${FINISH_ORDER_BTN}

close the bag
    Wait Until Element Is Visible   ${BAG_DIV}
    Click Element   ${CLOSE_BTN}

add more ${QUANTITY} unities
    Wait Until Element Is Visible   ${PLUS_BTN}
    FOR     ${i}    IN RANGE    ${QUANTITY}
        Click Element   ${PLUS_BTN}
    END
