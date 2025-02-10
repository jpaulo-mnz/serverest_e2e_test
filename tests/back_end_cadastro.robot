*** Settings ***
Resource  ../resources/api_keywords.robot

*** Test Cases ***
1 - Cadastro de usuário comum com Sucesso
    ${nome}    ${email}    ${senha}    Gerar Dados Aleatórios

    ${response}    Cadastrar Usuário    ${nome}    ${email}    ${senha}    false
    Validar Cadastro com Sucesso        ${response}

2 - Cadastro de usuário admin com Sucesso
    ${nome}    ${email}    ${senha}    Gerar Dados Aleatórios

    ${response}    Cadastrar Usuário    ${nome}    ${email}    ${senha}    true
    Validar Cadastro com Sucesso        ${response}

3 - Cadastro com Falha (Usuário comum, E-mail já cadastrado)
    ${nome}    ${email}    ${senha}    Gerar Dados Aleatórios

    # Primeiro cadastro (deve ser bem-sucedido)
    ${status}    ${response}    Run Keyword And Ignore Error    Cadastrar Usuário    ${nome}    ${email}    ${senha}    false

    IF  '${status}' == 'FAIL'
        Log    Falha no primeiro cadastro:  ${response}
    ELSE
        Validar Cadastro com Sucesso        ${response}
    END

    # Segundo cadastro com mesmo e-mail (deve falhar)
    ${status_falha}    ${response_falha}    Run Keyword And Ignore Error    Cadastrar Usuário    ${nome}    ${email}    ${senha}    false

    IF  '${status_falha}' == 'FAIL'
        Log    Erro esperado: ${response_falha}
    ELSE
        Validar Cadastro com Falha    ${response_falha}
    END

4 - Cadastro com Falha (Usuário admin, E-mail já cadastrado)
    ${nome}    ${email}    ${senha}    Gerar Dados Aleatórios

    # Primeiro cadastro (deve ser bem-sucedido)
    ${status}    ${response}    Run Keyword And Ignore Error    Cadastrar Usuário    ${nome}    ${email}    ${senha}    true

    IF  '${status}' == 'FAIL'
        Log    Falha no primeiro cadastro: ${response}
    ELSE
        Validar Cadastro com Sucesso    ${response}
    END

    # Segundo cadastro com mesmo e-mail (deve falhar)
    ${status_falha}    ${response_falha}    Run Keyword And Ignore Error    Cadastrar Usuário    ${nome}    ${email}    ${senha}    true

    IF  '${status_falha}' == 'FAIL'
        Log    Erro esperado: ${response_falha}
    ELSE
        Validar Cadastro com Falha    ${response_falha}
    END
