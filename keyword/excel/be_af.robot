*** Settings ***
Resource    ${CURDIR}/../../resource/import.robot

*** Keywords ***
# Save PNG To Excel
#     [Arguments]    ${png_path}    ${excel_path}    ${sheet_name}=${None}    ${cell}=${A1}
#     Open Workbook    ${excel_path}
#     ${sheet}=    Get Sheet By Name    ${sheet_name}
#     ${img}=    PIL.Image.open    ${png_path}
#     ${img}=    PIL.ImageOps.exif_transpose    ${img}
#     ${img}=    PIL.ImageOps.fit    ${img}    (100, 100)
#     ${img}=    PIL.ImageTk.PhotoImage    ${img}
#     Add Image To Sheet    ${sheet}    ${img}    ${cell}
#     Save Workbook    ${excel_path}
#     Close Workbook


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
    ExcelLibrary.Close All Excel Documents