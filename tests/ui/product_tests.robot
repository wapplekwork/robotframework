*** Settings ***
Documentation    Test cases สำหรับการทดสอบ Product functionality
Resource         ../../resources/keywords/common_keyword.robot
Resource         ../../resources/keywords/login_keywords.robot
Resource         ../../resources/pages/cart_page.robot


Test Tags        all  product
Suite Teardown   Close Browser Session
Test Teardown    Take Screenshot On Failure

*** Test Cases ***
TC006_Add_Single_Product_To_Cart
    [Documentation]    ทดสอบเพิ่มสินค้าหนึ่งชิ้นลงตะกร้า
    [Tags]    product    positive    smoke
    Create Chrome Webdriver  ${base_url}
    Login With Valid Credentials    ${login_data.valid_users.standard_user.username}    ${login_data.valid_users.standard_user.password}
    Add Product To Cart By Name    ${products_data.products_Backpack}
    Verify Cart Badge Count    1
    

TC007_Add_Multiple_Products_To_Cart
    [Documentation]    ทดสอบเพิ่มสินค้าหลายชิ้นลงตะกร้า
    [Tags]    product    positive
    Create Chrome Webdriver  ${base_url}
    Login With Valid Credentials    ${login_data.valid_users.standard_user.username}    ${login_data.valid_users.standard_user.password}
    Add Product To Cart By Name    ${products_data.products_Bike_Light}
    Add Product To Cart By Name    ${products_data.products_Backpack}
    Verify Cart Badge Count    2

TC008_View_Cart_Contents
    [Documentation]    ทดสอบการดูสินค้าในตะกร้า
    [Tags]    product    positive  fail
    Create Chrome Webdriver  ${base_url}
    Login With Valid Credentials    ${login_data.valid_users.standard_user.username}    ${login_data.valid_users.standard_user.password}
    Add Product To Cart By Name    ${products_data.products_Backpack}
    Go To Cart
    Verify Cart Page
    Verify Product In Cart    ${products_data.products_Backpack}
    # Verify Product In Cart    Sauce Labs Bike Light
    # Verify Product In Cart    Sauce Labs Bolt T-Shirt
