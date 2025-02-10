*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/variables.robot

*** Keywords ***
Acessa o sistema
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Finaliza o teste
    Sleep    2    seconds
    Close Browser