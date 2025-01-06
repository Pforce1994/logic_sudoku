*** Settings ***
Resource    ${CURDIR}/../resource/import.robot

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/demoapp/ApiDemos-debug.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=11}

# *** Test Cases ***
# Hello appium
    # AppiumLibrary