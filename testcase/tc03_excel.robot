*** Settings ***
Resource    ${CURDIR}/../resource/import.robot

*** Test Cases ***
Tc_01    
    be_af.Write date to excel    ${excel_path}   before    Sheet    1    1    Before
    be_af.Write date to excel    ${excel_path}   after    Sheet    1    2    After
# Tc_02
#     be_af.Save photo    ${excel_path}    save        ${photo3}       ${photo4}