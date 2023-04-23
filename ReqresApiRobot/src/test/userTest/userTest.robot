*** Settings ***

Library         BuiltIn
Library         Collections
Library         JSONLibrary
Library         RPA.JSON
Library    RPA.Archive
Suite Setup        Conectar na API
Resource    ../../resources/common/helpers.robot

*** Test Cases ***
TI_01 - Cadastrar cliente na lista "user"
        [Documentation]        Caso de Teste pra cadastrar usuario no endpoint user
        [Tags]        positivo        cadastroUser        smoke

        ${headers}=        Create Dictionary         content-type=application/json
        ${cadastrar}=        Gerar dados de usuário

        ${usuario_cadastro}=        Cadastrar usuário    ${cadastrar}

        Status code deve ser        201       ${usuario_cadastro}           
        ${nome}=        Gerar nome
        ${job}=        Gerar job           
        ${body}=        Gerar texto para body
        ${request}=        Create Dictionary    name=${nome}        body=${body}    
        ${cadastro}=        Enviar uma requisição POST no endpoint de users        ${request}        ${headers}

        Status code deve ser        201       ${cadastro}
        Dictionary Should Contain Key    ${cadastro.json()}        id    
        ${id}=       JSONLibrary.Get Value From Json    ${cadastro.json()}        id
        ${id}=       Convert To String    ${id[0]} 
        Should Not Be Empty    ${id}
TI_02 - Cadastro invalido na lista de "user"
        [Documentation]        Caso de Teste negativo no cadastro de usuario no endpoint user
        [Tags]        negativo        cadastroUser        smoke

        ${headers}=        Create Dictionary         content-type=application/json
        ${cadastrar}=        Gerar dados de usuário

        ${usuario_cadastro}=        Cadastrar usuário    ${cadastrar}

        Status code deve ser        201       ${usuario_cadastro}
        ${id}=        JSONLibrary.Get Value From Json    ${usuario_cadastro.json()}    id
        ${id}=        Convert To String    ${id[0]}
           
        ${job}=        Gerar job     
        ${body}=        Gerar texto para body
        ${request}=        Create Dictionary        job=${job}        body=${body}    
        ${cadastro}=        Enviar uma requisição POST no endpoint de users        ${request}        ${headers}

        Status code deve ser        201       ${cadastro}
        
TI_03 - Efetuar consulta de usuario em "user"
        [Documentation]        Caso de Teste pra validar a consulta do usuario no endpoint user
        [Tags]        positivo        cadastroUser        smoke

        ${headers}=        Create Dictionary         content-type=application/json

        ${users_consultados}=        Enviar uma requisição GET no endpoint de users        ${EMPTY}        ${headers}
        Log    ${users_consultados.json()}
        Log    ${users_consultados.status_code}  

        Status code deve ser        200       ${users_consultados}

TI_04 - Efetuar consulta de usuario invalida
        [Documentation]        Caso de Teste pra validação negativa de consulta de usuario em user
        [Tags]        negativo        cadastroUser        smoke

        ${headers}=        Create Dictionary         content-type=application/json

        ${users_consultados}=        Enviar uma requisição GET no endpoint de users        ${9999}        ${headers}
        Log    ${users_consultados.json()}
        Log    ${users_consultados.status_code}  

        Status code deve ser        404       ${users_consultados}