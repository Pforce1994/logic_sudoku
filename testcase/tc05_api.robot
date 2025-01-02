*** Settings ***
Resource    ${CURDIR}/../resource/import.robot

*** Variables ***
${BASE_URL}    https://reqres.in/api/users
*** Test Cases ***

Quick Get Request Test
    ${response}    RequestsLibrary.GET  ${BASE_URL}  expected_status=200
     BuiltIn.Log To Console    ${response.status_code}

Quick Get Request With Parameters Test
    ${response}    RequestsLibrary.GET  ${BASE_URL}  params=id=1  expected_status=200
    BuiltIn.Log To Console   ${response.json()}
     BuiltIn.Log To Console    ${response.status_code}

Quick PUT A JSON Body Test
    ${response}    RequestsLibrary.PUT  ${BASE_URL}/posts:  params=id=1   
    ...      data={"id": 3,"email": "janet.weaver@reqres.in"} 
    ...      expected_status=200
     BuiltIn.Log To Console    ${response.status_code}
    BuiltIn.Log To Console   ${response.json()}

Quick POST A JSON Body Test
    ${response}    RequestsLibrary.POST  ${BASE_URL}/posts:  
    ...    data={"name": "morpheus","job": "leader"}  
    ...    expected_status=201
     BuiltIn.Log To Console    ${response.status_code}
    BuiltIn.Log To Console   ${response.json()}

Quick DELET A JSON Body Test
    ${response}    RequestsLibrary.DELETE  ${BASE_URL}/posts:  params=id=1  expected_status=204
    BuiltIn.Log To Console    ${response.status_code}