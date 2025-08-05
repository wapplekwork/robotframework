*** Settings ***
Resource    ../keywords/common_keyword.robot
Resource    ../page_locators/checkout_locator.resource


*** Keywords ***
Verify Checkout Information Page
    [Documentation]    ตรวจสอบหน้ากรอกข้อมูล
    Wait Until Element Is Visible    ${CHECKOUT_TITLE}
    Element Text Should Be    ${CHECKOUT_TITLE}    Checkout: Your Information

Fill Customer Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    [Documentation]    กรอกข้อมูลลูกค้า
    Wait Until Element Is Visible    ${FIRST_NAME_FIELD}
    Wait For Element And Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Wait For Element And Input Text    ${LAST_NAME_FIELD}    ${last_name}
    Wait For Element And Input Text    ${POSTAL_CODE_FIELD}    ${postal_code}

Continue To Overview
    [Documentation]    ไปที่หน้าสรุปการสั่งซื้อ
    Wait For Element And Click    ${CONTINUE_BUTTON}

Finish Order
    [Documentation]    ยืนยันการสั่งซื้อ
    Wait For Element And Click    ${FINISH_BUTTON}

Verify Order Complete
    [Documentation]    ตรวจสอบการสั่งซื้อเสร็จสิ้น
    Wait Until Element Is Visible    ${COMPLETE_HEADER}
    Element Text Should Be    ${COMPLETE_HEADER}    Thank you for your order!

Back To Home
    [Documentation]    กลับไปหน้าแรก
    Wait For Element And Click    ${BACK_HOME_BUTTON}
