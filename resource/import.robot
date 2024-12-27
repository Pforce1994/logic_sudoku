*** Settings ***
Library        SeleniumLibrary
Library        ExcelLibrary
Library        DatabaseLibrary
Library        OperatingSystem
Library        Collections
Library        DateTime
Library        String
Library        JSONLibrary
Library        RequestsLibrary
Library        AppiumLibrary

# page
Resource    ${CURDIR}/../keyword/ui/page/sudoku.robot

# testdata and setting
# Variables    ${CURDIR}/testdata/data.yaml
Variables    ${CURDIR}/settings/settings.yaml


# locator
Resource    ${CURDIR}/../keyword/ui/locator/sudoku_locator.robot

# common
Resource    ${CURDIR}/../keyword/common/common_web.robot

# page
Resource    ${CURDIR}/../keyword/ui/page/sudoku.robot