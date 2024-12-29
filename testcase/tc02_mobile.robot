*** Settings ***
Resource    ${CURDIR}/../resource/import.robot

*** Variables ***
# ${REMOTE_URL}          http://localhost:4723/wd/hub
# ${PLATFORM_NAME}       Android
# ${PLATFORM_VERSION}    11.0
# ${DEVICE_NAME}         emulator-5554
# ${APP}                 /path/to/your/app.apk

*** Variables ***
${APPIUM_URL}          http://localhost:4723/wd/hub
${PLATFORM_NAME}       iOS
${DEVICE_NAME}         iPhone Simulator
${PLATFORM_VERSION}    16.0
${APP}                 path/to/your.app
${AUTOMATION_NAME}     XCUITest

*** Test Cases ***
Launch iOS App
    Open Application    ${APPIUM_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    platformVersion=${PLATFORM_VERSION}    automationName=${AUTOMATION_NAME}    app=${APP}
    Sleep               5 seconds
    Close Application

    
    