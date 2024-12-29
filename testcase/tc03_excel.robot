*** Settings ***
Resource    ${CURDIR}/../resource/import.robot

*** Test Cases ***
Tc_01    
    be_af.Read Data From Excel     ${excel_path}    Hello    Sheet1    1    1
    be_af.Write date to excel    ${excel_path}   before    Sheet1    1    1    Before
    be_af.Write date to excel    ${excel_path}   after    Sheet1    1    2    After