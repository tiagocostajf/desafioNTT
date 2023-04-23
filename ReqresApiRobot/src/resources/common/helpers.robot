*** Settings ***
Library        FakerLibrary
Library        BuiltIn

Resource    ../user-resources/UserResources.robot

*** Variables ***
@{jobs}=        leader        QA        DEV        PO        SM

*** Keywords ***
Gerar dados de usuário
    ${nome}=        Gerar nome
    ${job}=        Gerar job

    ${usuario}=        Create Dictionary        name=${nome}        job=${job}    
    [Return]        ${usuario}

Gerar nome
    ${nome}=        FakerLibrary.Name
    [Return]        ${nome}

Gerar job
    ${job}=        Evaluate        random.choice(${jobs})        random
    [Return]    ${job}

Gerar texto para body
    ${texto_body}=        FakerLibrary.Text        max_nb_chars=200
    [Return]        ${texto_body}

Cadastrar usuário
    [Arguments]        ${usuario}
    ${headers}=        Create Dictionary         content-type=application/json
    ${usuario_cadastrado}=        Enviar uma requisição POST no endpoint de users        ${usuario}        ${headers}        
    [Return]        ${usuario_cadastrado}