*** Settings ***
Documentation    Test cases สำหรับการทดสอบ Checkout functionality
Resource         ../../resources/keywords/common_keyword.robot
Resource         ../../resources/keywords/login_keywords.robot
Resource         ../../resources/pages/cart_page.robot
Resource         ../../resources/pages/checkout_page.robot


Test Tags       all  checkout
Suite Teardown   Close Browser Session
Test Teardown    Take Screenshot On Failure

*** Test Cases ***
TC009_Complete_Purchase_Flow
    [Documentation]    ทดสอบกระบวนการซื้อสินค้าครบถ้วน
    [Tags]    checkout    positive    smoke    e2e
    Create Chrome Webdriver  ${base_url}
    Login With Valid Credentials    ${login_data.valid_users.standard_user.username}    ${login_data.valid_users.standard_user.password}
    # Add product to cart
    Add Product To Cart By Name    ${products_data.products_Backpack}
    Verify Cart Badge Count    1
    
    # Go to cart
    Go To Cart
    Verify Cart Page
    Verify Product In Cart    ${products_data.products_Backpack}
    
    # Proceed to checkout
    Proceed To Checkout
    Verify Checkout Information Page
    
    # Fill information
    Fill Customer Information   ${customer_data.first_name}   ${customer_data.last_name }   ${customer_data.postal_code}
    Continue To Overview
    
    # Complete order
    Finish Order
    Verify Order Complete
    
    # Back to home
    Back To Home
    Verify Products Page

TC010_Checkout_With_Empty_Information
    [Documentation]    ทดสอบ checkout โดยไม่กรอกข้อมูล
    [Tags]    checkout    negative
    Create Chrome Webdriver  ${base_url}
    Login With Valid Credentials    ${login_data.valid_users.standard_user.username}    ${login_data.valid_users.standard_user.password}
    Add Product To Cart By Name    ${products_data.products_Backpack}

    Go To Cart
    Proceed To Checkout
    Verify Checkout Information Page
    Continue To Overview
    #Should show error message for missing information
