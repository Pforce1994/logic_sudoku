*** Settings ***
Resource    ${CURDIR}/../../resource/import.robot

*** Keywords ***
Go to web sudoku
    Open Browser    ${url}    browser=chrome
    SeleniumLibrary.Maximize Browser Window
    ${status}     BuiltIn.Run Keyword And Return Status     SeleniumLibrary.Wait Until Element Is Visible    ${sudoku['logo']}  timeout=${10s_timeout}    
    IF  ${status} != ${True}
        FOR  ${i}  IN  0  ${retry}
            ${status}     BuiltIn.Run Keyword And Return Status     SeleniumLibrary.Wait Until Element Is Visible    ${sudoku['logo']}  timeout=${10s_timeout}
            Exit For Loop If    ${status}
        END
        
    END

    
    