*** Settings ***
Resource    ${CURDIR}/../../resource/import.robot

*** Keywords ***
Save photo
    [Arguments]   ${file_name}   ${doc_id}      ${photo1}    ${photo2}
    ${workbook}   ExcelLibrary.Open Excel Document       ${excel_path}    ${doc_id} 
    ${result}     process.Run Process    python  -u   ${CURDIR}/../../keyword/excel/save_photo.py     ${photo1}    ${photo2}
    [Teardown]    ExcelLibrary.Close Current Excel Document

Read Data From Excel
    [Arguments]    ${file_name}   ${doc_id}    ${sheet_name}    ${row_num}    ${colum_num}     
    ${workbook}   ExcelLibrary.Open Excel Document       ${excel_path}    ${doc_id}         
    # ${sheet}      ExcelLibrary.Get Sheet    ${sheet_name}    
    ${value}      ExcelLibrary.Read Excel Cell   ${1}    ${1}    ${sheet_name}
    Log To Console    ${value}
    [Teardown]    ExcelLibrary.Close Current Excel Document  
    
Write date to excel
    [Arguments]    ${file_name}    ${doc_id}    ${sheet_name}    ${row_num}    ${colum_num}    ${value}
    ${workbook}   ExcelLibrary.Open Excel Document       ${file_name}    ${doc_id}             
    ExcelLibrary.Write Excel Cell    ${row_num}    ${colum_num}    ${value}     ${sheet_name}    
    ExcelLibrary.Save Excel Document        ${file_name}
    [Teardown]    ExcelLibrary.Close Current Excel Document   