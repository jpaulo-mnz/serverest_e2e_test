*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  FakerLibrary
Resource  ../resources/variables.robot

*** Keywords ***
Cadastrar Usuário
    [Arguments]    ${nome}    ${email}    ${senha}    ${admin}
    
    ${payload}    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=${senha}
    ...    administrador=${admin}

    ${response}    POST    ${BASE_URL}${ENDPOINT}    json=${payload}

    RETURN    ${response}

Validar Cadastro com Sucesso
    [Arguments]    ${response}

    Should Be Equal As Strings    ${response.status_code}          201
    Dictionary Should Contain Key    ${response.json()}            _id
    Dictionary Should Contain Value    ${response.json()}          Cadastro realizado com sucesso

Validar Cadastro com Falha
    [Arguments]    ${response}

    ${status}    ${result}    Run Keyword And Ignore Error
    ... Should Be Equal As Strings    ${response.status_code}    400

    IF  '${status}' == 'FAIL'
        Log    Erro esperado não ocorreu: ${response}
    ELSE
        Dictionary Should Contain Key    ${response.json()}         message
        Dictionary Should Contain Value    ${response.json()}       Este email já está sendo usado
    END

Gerar Dados Aleatórios
    ${nome}    FakerLibrary.Name
    ${email}   FakerLibrary.Email
    ${senha}   FakerLibrary.Password
    RETURN     ${nome}    ${email}    ${senha}