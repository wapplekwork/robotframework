*** Settings ***
Resource    ../keywords/common_keyword.robot
Resource    ../page_locators/login_locator.resource

*** Keywords ***
Input Username
    [Arguments]    ${username}
    [Documentation]    ใส่ username
    Wait For Element And Input Text    ${LOGIN_USERNAME_FIELD}    ${username}

Input Password2 
    [Arguments]    ${password}
    [Documentation]    ใส่ password
    Wait For Element And Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}

Click Login Button
    [Documentation]    คลิกปุ่ม login
    Wait For Element And Click    ${LOGIN_BUTTON}

Verify Login Error Message
    [Arguments]    ${expected_message}
    [Documentation]    ตรวจสอบ error message
    Wait Until Element Is Visible    ${LOGIN_ERROR_MESSAGE}
    Element Text Should Be    ${LOGIN_ERROR_MESSAGE}    ${expected_message}

Clear Login Error
    [Documentation]    ล้าง error message
    Wait For Element And Click    ${LOGIN_ERROR_BUTTON}
