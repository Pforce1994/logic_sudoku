*** Settings ***
Resource    ${CURDIR}/../resource/import.robot

*** Test Cases ***
Parse JSON String
    ${json_string}     BuiltIn.Set Variable    {"name": "John", "age": 30, "city": "New York"}
    ${parsed_json}    JSONLibrary.Convert String To Json    ${json_string}
    BuiltIn.Log To Console     ${parsed_json}  # Output: John
    BuiltIn.Log To Console  ${parsed_json['name']}  # Output: John


Access JSON Data
    ${json_string}    BuiltIn.Set Variable    {"person": {"name": "John", "details": {"age": 30}}}
    ${parsed_json}    JSONLibrary.Convert String To Json    ${json_string}
    ${name}           JSONLibrary.Get Value From Json    ${parsed_json}    $.person.name
    ${age}            JSONLibrary.Get Value From Json    ${parsed_json}    $.person.details.age
     BuiltIn.Log To Console   Name: ${name}, Age: ${age}  # Output: Name: John, Age: 30

Merge JSON Objects
    ${json1}     BuiltIn.Set Variable    {"name": "John"}
    ${json2}     BuiltIn.Set Variable    {"age": 30}
    ${_json1}    JSONLibrary.Convert String To Json    ${json1}
    ${_json2}    JSONLibrary.Convert String To Json    ${json2}
    ${merged}    JSONLibrary.Add Object To Json    ${_json1}    $    ${_json2}    
    BuiltIn.Log To Console    ${merged}      # Output: {"name": "John", "age": 30}

Modify JSON Data
    ${json_string}     BuiltIn.Set Variable    {"name": "John", "age": 30}
    ${parsed_json}    JSONLibrary.Convert String To Json   ${json_string}
    ${parsed_json}    JSONLibrary.Update Value To Json    ${parsed_json}    $.age    35 
    BuiltIn.Log To Console    ${parsed_json}      # Output: {"name": "John", "age": 35}

Compare JSON Objects
    ${json1}     BuiltIn.Set Variable    {"name": "John", "age": 30}
    ${json2}     BuiltIn.Set Variable    {"age": 30, "name": "John"}
    ${j1}       JSONLibrary.Convert String To Json    ${json1}
    ${j2}       JSONLibrary.Convert String To Json    ${json2}
    ${status}    BuiltIn.Run Keyword And Return Status     BuiltIn.Should Be Equal     ${j1}    ${j2}
    BuiltIn.Log To Console    ${status}