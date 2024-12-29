*** Settings ***
Resource    ${CURDIR}/../resource/import.robot
    
*** Test Cases ***
Call Python With Arguments
    ${result}     process.Run Process    python  -u   ${CURDIR}/../keyword/common/calculator.py
    Log To Console    \n${result}
    Log To Console    \n${result.stdout}
    Log To Console    \n${result.stderr}

