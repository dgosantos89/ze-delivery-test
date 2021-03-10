*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      chrome

*** Keywords ***
Setup
    Open Browser        about:blank   ${BROWSER}

Teardown
    Close Browser