*** Settings ***
Resource    ${CURDIR}/../resource/import.robot

*** Test Cases ***
Tc_01
    common_web.Go to web sudoku
    ${photo_be}    sudoku.Receive the sudoku
    sudoku.Processing the sudoku
    ${photo_af}    sudoku.Input data
   
    