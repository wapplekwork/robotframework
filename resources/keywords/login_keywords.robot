*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/login_page.robot
Resource    ../pages/products_page.robot

*** Keywords ***
Login With Valid Credentials
    [Arguments]    ${username}    ${password}
    [Documentation]    Login ด้วย username และ password ที่ถูกต้อง
    Input Username    ${username}
    Input Password2    ${password}
    Click Login Button
    Verify Products Page

Login With Invalid Credentials
    [Arguments]    ${username}    ${password}
    [Documentation]    Login ด้วย username และ password ที่ไม่ถูกต้อง
    Input Username    ${username}
    Input Password2    ${password}
    Click Login Button

Verify Login Failed
    [Arguments]    ${expected_error}
    [Documentation]    ตรวจสอบการ login ล้มเหลว
    Verify Login Error Message    ${expected_error}
