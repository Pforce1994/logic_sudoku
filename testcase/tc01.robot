*** Settings ***
Resource    ${CURDIR}/../resource/import.robot

*** Test Cases ***
Tc_01
    common_web.Go to web sudoku
    sudoku.Receive the sudoku
    sudoku.Processing the sudoku
    sudoku.Input data