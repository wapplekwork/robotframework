*** Settings ***
Library    SeleniumLibrary
Variables  ../../data/data.yaml
Resource   selenium_keywords.resource

*** Variables ***
${EXPLICIT_WAIT}    30
${headless}         false
${implicit_wait}    10

*** Keywords ***
Open Browser To Login Page
    [Documentation]    เปิด browser และไปที่หน้า login
    Log   ${base_url}
    Title Should Be    Swag Labs

Close Browser Session
    [Documentation]    ปิด browser
    Close Browser

Wait For Element And Click
    [Arguments]    ${locator}    ${timeout}=${EXPLICIT_WAIT}
    [Documentation]    รอ element และคลิก
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Click Element    ${locator}

Wait For Element And Input Text
    [Arguments]    ${locator}    ${text}    ${timeout}=${EXPLICIT_WAIT}
    [Documentation]    รอ element และใส่ text
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Input Text    ${locator}    ${text}

Verify Page Title
    [Arguments]    ${expected_title}
    [Documentation]    ตรวจสอบ title ของหน้า
    Title Should Be    ${expected_title}

Take Screenshot On Failure
    [Documentation]    ถ่าย screenshot เมื่อเจอ error
    Run Keyword If Test Failed    Capture Page Screenshot    failure-{index}.png
    Close Browser