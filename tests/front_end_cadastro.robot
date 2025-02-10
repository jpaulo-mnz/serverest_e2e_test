*** Settings ***
Library  SeleniumLibrary
Library  FakerLibrary
Resource  ../pages/acoes_gerais_page.robot
Resource  ../pages/cadastro_page.robot
Resource  ../resources/variables.robot

*** Test Cases ***
1 - Cadastro de usuário comum com Sucesso
    ${NAME}    ${EMAIL}    ${PASSWORD}    Gerar Dados Aleatórios

    Acessa o sistema
    Vai para a página de cadastro
    Preenche os campos do formulário e submete    ${NAME}    ${EMAIL}    ${PASSWORD}
    Verifica a mensagem de alerta                 ${SUCCESS_MSG_ELEMENT}    ${SUCCESS_MSG_DATA}
    Finaliza o teste

2 - Cadastro de usuário admin com Sucesso
    ${NAME}    ${EMAIL}    ${PASSWORD}    Gerar Dados Aleatórios

    Acessa o sistema
    Vai para a página de cadastro
    Escolhe o tipo de usuario admin
    Preenche os campos do formulário e submete    ${NAME}    ${EMAIL}    ${PASSWORD}
    Verifica a mensagem de alerta                 ${SUCCESS_MSG_ELEMENT}    ${SUCCESS_MSG_DATA}
    Finaliza o teste

3 - Cadastro com Falha (Usuário comum, E-mail já cadastrado)
    ${NAME_DATA}    ${EMAIL_DATA}    ${PASSWORD_DATA}    Gerar Dados Aleatórios

    Acessa o sistema
    Vai para a página de cadastro
    Preenche os campos do formulário e submete    ${NAME_DATA}    ${EMAIL_DATA}    ${PASSWORD_DATA}
    Verifica a mensagem de alerta                 ${SUCCESS_MSG_ELEMENT}    ${SUCCESS_MSG_DATA}
    Finaliza o teste

    Acessa o sistema
    Vai para a página de cadastro
    Preenche os campos do formulário e submete    ${NAME_DATA}    ${EMAIL_DATA}    ${PASSWORD_DATA}
    Verifica a mensagem de alerta                 ${ERROR_MSG_ELEMENT}    ${ERROR_MSG_DATA}
    Finaliza o teste

4 - Cadastro com Falha (Usuário admin, E-mail já cadastrado)
    ${NAME_DATA}    ${EMAIL_DATA}    ${PASSWORD_DATA}    Gerar Dados Aleatórios

    Acessa o sistema
    Vai para a página de cadastro
    Escolhe o tipo de usuario admin
    Preenche os campos do formulário e submete    ${NAME_DATA}    ${EMAIL_DATA}    ${PASSWORD_DATA}
    Verifica a mensagem de alerta                 ${SUCCESS_MSG_ELEMENT}    ${SUCCESS_MSG_DATA}
    Finaliza o teste

    Acessa o sistema
    Vai para a página de cadastro
    Escolhe o tipo de usuario admin
    Preenche os campos do formulário e submete    ${NAME_DATA}    ${EMAIL_DATA}    ${PASSWORD_DATA}
    Verifica a mensagem de alerta                 ${ERROR_MSG_ELEMENT}    ${ERROR_MSG_DATA}
    Finaliza o teste