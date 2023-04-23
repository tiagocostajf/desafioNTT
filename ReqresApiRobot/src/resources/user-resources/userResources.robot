*** Settings ***
Resource        ../../resources/common/commonResource.robot
Library         RequestsLibrary

*** Variables ***

*** Keywords ***
Enviar uma requisição POST no endpoint de users
        [Arguments]        ${usuario}        ${headers}        
        ${response}=        POST On Session        alias=goRestAPI        url=${ENDPOINT_POSTS}        
        ...                                        json=${usuario}        headers=${headers}        expected_status=any
        [Return]        ${response}

Enviar uma requisição GET no endpoint de users
        [Arguments]        ${id_usuario}        ${headers}
        ${response}=        GET On Session        alias=goRestAPI        url=${ENDPOINT_POSTS}/${id_usuario}
        ...                                       headers=${headers}        expected_status=any
        [Return]        ${response}