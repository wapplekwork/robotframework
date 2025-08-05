*** Settings ***
Resource    ../keywords/common_keyword.robot
Resource    ../page_locators/product_locator.resource

*** Keywords ***
Verify Products Page
    [Documentation]    ตรวจสอบหน้า products
    Wait Until Element Is Visible    ${PRODUCTS_TITLE}
    Element Text Should Be    ${PRODUCTS_TITLE}    Products

Add Product To Cart By Name
    [Arguments]    ${product_name}
    [Documentation]    เพิ่มสินค้าลงตะกร้าโดยใช้ชื่อ
     log   ${ADD_TO_CART_BUTTON_BY_NAME} 
    ${add_button}=    Set Variable    //*[contains(text(),'${product_name}')]/following::*[@class='btn btn_primary btn_small btn_inventory '][1]
    Wait For Element And Click    ${add_button}

Verify Cart Badge Count
    [Arguments]    ${expected_count}
    [Documentation]    ตรวจสอบจำนวนสินค้าในตะกร้า
    Wait Until Element Is Visible    ${SHOPPING_CART_BADGE}
    Element Text Should Be    ${SHOPPING_CART_BADGE}    ${expected_count}    

Go To Cart
    [Documentation]    ไปที่หน้าตะกร้า
    Wait For Element And Click    ${SHOPPING_CART_LINK}

Logout
    [Documentation]    ออกจากระบบ
    Wait For Element And Click    ${MENU_BUTTON}
    Wait For Element And Click    ${LOGOUT_LINK}
