*** Settings ***
Resource    ${CURDIR}/../../../resource/import.robot

*** Variables ***
@{tr} 
@{tr_output}  
@{xy_output} 
*** Keywords ***
Receive the sudoku
    ${status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${sudoku['table_sudoku']}    timeout=${10s_timeout}
    IF  ${status} == ${False}
        FOR  ${i}  IN RANGE  0    ${retry}
            ${status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${sudoku['table_sudoku']}    timeout=${10s_timeout}
            Exit For Loop If    ${status}   
        END
    END
    ${photo}    Set Variable    ${CURDIR}/../../../testcase/log/photo_output/sudoku_before.png
    SeleniumLibrary.Capture Page Screenshot    ${photo}
    FOR  ${i}  IN RANGE  1  10
        ${take_tr}     BuiltIn.Set Variable      (${sudoku['table_row']})[${i}]
        @{td}    BuiltIn.Create List
        FOR  ${ii}  IN RANGE  1    10
            ${take_td}    BuiltIn.Set Variable            (${take_tr}${sudoku['table_colum']})[${ii}]
            SeleniumLibrary.Mouse Over    ${take_td}
            ${status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${take_td}    timeout=${20s_timeout}
            IF  ${status} == ${False}
                FOR  ${n}  IN RANGE  0    ${{retry}}
                    ${status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${take_td}    timeout=${20s_timeout}
                    Exit For Loop If    ${status}
                END  
            END
            ${number}    SeleniumLibrary.Get Text    ${take_td}
            IF    ${ii} > ${0}
                IF    "${number}" == ""
                    Collections.Append To List    ${td}    0
                ELSE  
                    # ${number}    BuiltIn.Convert To Integer    ${number}
                    Collections.Append To List    ${td}     ${number}
                END 
            END
        END
        Collections.Append To List    ${tr}     ${td}
    END
    # BuiltIn.Log To Console    ${tr}    
    RETURN    ${photo}

Processing the sudoku
    # BuiltIn.Log To Console    ${tr}[0]
    # @{tr_test}    BuiltIn.Create List   
    # @{td_1}       BuiltIn.Create List     0  1  0  0  2  3  0  0  0                     
    # @{td_2}       BuiltIn.Create List     2  0  0  4  0  0  0  5  0
    # @{td_3}       BuiltIn.Create List     0  6  0  0  7  0  0  0  0
    # @{td_4}       BuiltIn.Create List     8  0  0  9  0  5  0  4  1
    # @{td_5}       BuiltIn.Create List     0  0  1  2  0  6  3  0  0
    # @{td_6}       BuiltIn.Create List     4  5  0  8  0  7  0  0  9
    # @{td_7}       BuiltIn.Create List     0  0  0  0  5  0  0  7  0
    # @{td_8}       BuiltIn.Create List     0  9  0  0  0  2  0  0  4
    # @{td_9}       BuiltIn.Create List     0  0  0  3  8  0  0  2  0
    # FOR    ${i}    IN RANGE    1    10
    #     Collections.Append To List    ${tr_test}    ${td_${i}}
    # END              
     @{xy_zero}  BuiltIn.Create List
     ${n}    BuiltIn.Set Variable    1
    # เก็บตำแหน่ง 0
    Log To Console    tr:${tr}
    FOR    ${g}  ${o}  IN ENUMERATE    @{tr}   
        FOR    ${gg}  ${oo}  IN ENUMERATE   @{o}
            IF    ${oo} == ${0}
                @{r_c}    BuiltIn.Create List
                Collections.Append To List    ${r_c}    ${g}  ${gg}
                # Log To Console    ${r_c}
                Collections.Append To List    ${xy_zero}    ${r_c}
            END
        END
    END  
    Log To Console    xy_zero:${xy_zero}
    ${len_xy}    BuiltIn.Get Length    ${xy_zero}
    WHILE    ${len_xy} != ${0}
       
    FOR    ${a}  ${b}   IN ENUMERATE    @{xy_zero}
        # นำค่าตำแหน่งออกมาเก็บในตัวแปรเพื่อจะนำไปใช้
        FOR    ${aa}  ${bb}    IN ENUMERATE    @{b}
            # Log To Console    ${aa}:${bb}
            IF    ${aa} == ${0}
                ${x}    BuiltIn.Set Variable    ${bb}
            ELSE IF    ${aa} == ${1}
                ${y}    BuiltIn.Set Variable    ${bb}
            END  
        END 
        # ทำการคำนวณหาตัวเลขที่ต้องการ
        @{test}   BuiltIn.Create List    1    2    3    4    5    6    7    8    9
          FOR    ${i}  ${v}  IN ENUMERATE    @{tr}   
                FOR    ${ii}  ${vv}  IN ENUMERATE   @{v}
                    IF    ${i} == ${x}
                        FOR    ${iii}    IN    @{test}
                            ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${iii}    ${vv}
                            BuiltIn.Run Keyword If    ${status}     Collections.Remove Values From List    ${test}    ${iii}
                        
                        END
                        # Log    ${test}
                    ELSE IF    ${ii} == ${y} 
                        FOR    ${iii}    IN    @{test}
                            ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${iii}    ${vv}
                            BuiltIn.Run Keyword If    ${status}     Collections.Remove Values From List    ${test}    ${iii}
                           
                        END
                        # Log    ${test}
                    ELSE IF    (${x} < ${3} and ${y} < ${3}) and (${i} < ${3} and ${ii} < ${3})
                            # Log To Console     ช่อง 1 
                             FOR    ${iii}    IN    @{test}
                                ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${iii}    ${vv}
                                BuiltIn.Run Keyword If    ${status}     Collections.Remove Values From List    ${test}    ${iii}
                            END
                    ELSE IF  (${x} < ${3} and ${y} >= ${3} and ${y} < ${6}) and (${i} < ${3} and ${ii} >= ${3} and ${ii} < ${6}) 
                            # Log To Console     ช่อง 2 
                            FOR    ${iii}    IN    @{test}
                                ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${iii}    ${vv}
                                BuiltIn.Run Keyword If    ${status}     Collections.Remove Values From List    ${test}    ${iii}
                            END
                    ELSE IF  (${x} < ${3} and ${y} >= ${6} and ${y} < ${9}) and (${i} < ${3} and ${ii} >= ${6} and ${ii} < ${9})
                            # Log To Console     ช่อง 3
                            FOR    ${iii}    IN    @{test}
                                ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${iii}    ${vv}
                                BuiltIn.Run Keyword If    ${status}     Collections.Remove Values From List    ${test}    ${iii}
                            END
                    ELSE IF  (${x} >= ${3} and ${x} < ${6} and ${y} < ${3}) and (${i} >= ${3} and ${i} < ${6} and ${ii} < ${3})
                            # Log To Console     ช่อง 4
                            FOR    ${iii}    IN    @{test}
                                ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${iii}    ${vv}
                                BuiltIn.Run Keyword If    ${status}     Collections.Remove Values From List    ${test}    ${iii}
                            END
                    ELSE IF  (${x} >= ${3} and ${x} < ${6} and ${y} >= ${3} and ${y} < ${6}) and (${i} >= ${3} and ${i} < ${6} and ${ii} >= ${3} and ${ii} < ${6})
                            # Log To Console     ช่อง 5
                            FOR    ${iii}    IN    @{test}
                                ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${iii}    ${vv}
                                BuiltIn.Run Keyword If    ${status}     Collections.Remove Values From List    ${test}    ${iii}
                            END
                    ELSE IF  (${x} >= ${3} and ${x} < ${6} and ${y} >= ${6} and ${y} < ${9}) and (${i} >= ${3} and ${i} < ${6} and ${ii} >= ${6} and ${ii} < ${9})
                            # Log To Console     ช่อง 6
                            FOR    ${iii}    IN    @{test}
                                ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${iii}    ${vv}
                                BuiltIn.Run Keyword If    ${status}     Collections.Remove Values From List    ${test}    ${iii}
                            END
                    ELSE IF  (${x} >= ${6} and ${x} < ${9} and ${y} < ${3}) and (${i} >= ${6} and ${i} < ${9} and ${ii} < ${3})
                            # Log To Console     ช่อง 7
                            FOR    ${iii}    IN    @{test}
                                ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${iii}    ${vv}
                                BuiltIn.Run Keyword If    ${status}     Collections.Remove Values From List    ${test}    ${iii}
                            END
                    ELSE IF  (${x} >= ${6} and ${x} < ${9} and ${y} >= ${3} and ${y} < ${6}) and (${i} >= ${6} and ${i} < ${9} and ${ii} >= ${3} and ${ii} < ${6})
                            # Log To Console     ช่อง 8
                            FOR    ${iii}    IN    @{test}
                                ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${iii}    ${vv}
                                BuiltIn.Run Keyword If    ${status}     Collections.Remove Values From List    ${test}    ${iii}
                            END
                    ELSE IF  (${x} >= ${6} and ${x} < ${9} and ${y} >= ${6} and ${y} < ${9}) and (${i} >= ${6} and ${i} < ${9} and ${ii} >= ${6} and ${ii} < ${9})
                            # Log To Console     ช่อง 9    
                            FOR    ${iii}    IN    @{test}
                                ${status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Should Be Equal    ${iii}    ${vv}
                                BuiltIn.Run Keyword If    ${status}     Collections.Remove Values From List    ${test}    ${iii}
                            END
                    END    
                     
                END
            END   
              ${len}    BuiltIn.Get Length    ${test}
            #    Log To Console    ${b} : ${test} :len=${len_xy}
                IF    ${len} == ${1}
                    Collections.Set List Value    ${tr}[${x}]        ${y}    ${test}[0]    
                    Collections.Remove Values From List    ${xy_zero}    ${b}
                    ${x}    BuiltIn.Evaluate    ${x}+${1}
                    ${y}    BuiltIn.Evaluate    ${y}+${1}
                    &{xy_output${n}}    BuiltIn.Create Dictionary
                    Collections.Set To Dictionary    ${xy_output${n}}    x=${x}    y=${y}    value=${test}[0]
                    Collections.Append To List    ${xy_output}    ${xy_output${n}}
                     ${len_xy}    BuiltIn.Get Length    ${xy_zero}
                    # Log To Console    ${xy_zero}
                    Log To Console    รอบที่: ${n}
                    Log To Console    ${b} : ${test}[0] :len=${len_xy}
                    ${n}    BuiltIn.Evaluate    ${n}+${1}
                END
    END
    END

Input data
    ${status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${sudoku['table_sudoku']}    timeout=${10s_timeout}
    IF  ${status} == ${False}
        FOR  ${i}  IN RANGE  0    ${retry}
            ${status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${sudoku['table_sudoku']}    timeout=${10s_timeout}
            Exit For Loop If    ${status}   
        END
    END
    FOR    ${a}    IN  @{xy_output}
        ${take_tr}     BuiltIn.Set Variable      (${sudoku['table_row']})[${a["x"]}]
            ${take_td}     BuiltIn.Set Variable     (${take_tr}${sudoku['table_colum']})[${a["y"]}]
        SeleniumLibrary.Click Element       ${take_td}
        Log To Console    ${take_td}:${a["value"]}
        SeleniumLibrary.Click Button    (${sudoku['numpad']})[${a["value"]}]
    END
    ${photo}    Set Variable   ${CURDIR}/../../../testcase/log/photo_output/sudoku_after.png
    SeleniumLibrary.Capture Page Screenshot    ${photo}
    RETURN    ${photo}
  

 
      



    
    
    

    