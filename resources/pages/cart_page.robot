*** Settings ***
Resource    ../keywords/common_keyword.robot
Resource    ../page_locators/cart_locator.resource

*** Keywords ***
Verify Cart Page
    [Documentation]    ตรวจสอบหน้าตะกร้า
    Wait Until Element Is Visible    ${CART_TITLE}
    Element Text Should Be    ${CART_TITLE}    Your Cart

Verify Product In Cart
    [Arguments]    ${product_name}
    [Documentation]    ตรวจสอบสินค้าในตะกร้า
    ${product_locator}=    Set Variable    xpath://div[@class='cart_item'][.//div[@class='inventory_item_name' and text()='${product_name}']]
    Wait Until Element Is Visible    ${product_locator}

Remove Product From Cart
    [Arguments]    ${product_name}
    [Documentation]    ลบสินค้าจากตะกร้า
    ${remove_button}=    Set Variable    xpath://div[@class='cart_item'][.//div[@class='inventory_item_name' and text()='${product_name}']]//button
    Wait For Element And Click    ${remove_button}

Continue Shopping
    [Documentation]    กลับไปซื้อสินค้าต่อ
    Wait For Element And Click    ${CONTINUE_SHOPPING_BUTTON}

Proceed To Checkout
    [Documentation]    ไปที่หน้า checkout
    Wait For Element And Click    ${CHECKOUT_BUTTON}
