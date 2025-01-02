*** Settings ***
Resource    ${CURDIR}/../resource/import.robot
Suite Setup       Connect To Database    ${DBType}    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database


*** Variables ***
${DBHost}         localhost
${DBName}         databasename
${DBPass}         12345678
${DBPort}         3307
${DBUser}         root
${DBType}         pymysql

*** Test Cases ***
Test Database Connection
    ${result}  DatabaseLibrary.Query     SELECT * FROM Persons limit 1
    BuiltIn.Log To Console  ${result}


