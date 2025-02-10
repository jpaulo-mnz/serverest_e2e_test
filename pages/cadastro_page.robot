*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/variables.robot

*** Variables ***
${USER_TYPE_ELEMENT}    id=administrador
${NAME_FIELD}           id=nome
${EMAIL_FIELD}          id=email
${PASSWORD_FIELD}       id=password
${REGISTER_BUTTON}      xpath=//*[@data-testid="cadastrar"]
${SUCCESS_MSG_ELEMENT}  xpath=//a[@class='alert-link']
${ERROR_MSG_ELEMENT}    xpath=//*[@class='alert alert-secondary alert-dismissible']

*** Keywords ***
Vai para a página de cadastro
    Wait Until Element Is Visible        ${REGISTER_BUTTON}     timeout=5s
    Click Element                        ${REGISTER_BUTTON}

Escolhe o tipo de usuario admin
    Wait Until Element Is Visible        ${USER_TYPE_ELEMENT}   timeout=5s
    Click Element                        ${USER_TYPE_ELEMENT}

Preenche os campos do formulário e submete
    [Arguments]   ${name}    ${email}    ${password}
    Input Text    ${NAME_FIELD}          ${name}
    Input Text    ${EMAIL_FIELD}         ${email}
    Input Text    ${PASSWORD_FIELD}      ${password}
    Click Button  ${REGISTER_BUTTON}

Verifica a mensagem de alerta
    [Arguments]    ${alert_element}      ${alert_content}
    Wait Until Element Is Visible        ${alert_element}       timeout=5s
    Element Should Contain               ${alert_element}       ${alert_content}

Gerar Dados Aleatórios
    ${nome}    FakerLibrary.Name
    ${email}   FakerLibrary.Email
    ${senha}   FakerLibrary.Password
    RETURN     ${nome}    ${email}    ${senha}