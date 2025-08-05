*** Settings ***
Documentation    Test cases สำหรับการทดสอบ Login functionality
Resource         ../../resources/keywords/common_keyword.robot
Resource         ../../resources/keywords/login_keywords.robot

Test Tags        all  login

Suite Teardown   Close Browser Session
Test Teardown    Take Screenshot On Failure

*** Test Cases ***
TC001_Login_With_Valid_Standard_User
    [Documentation]    ทดสอบ login ด้วย standard user
    [Tags]    login    positive    smoke
    Create Chrome Webdriver  ${base_url}
    Login With Valid Credentials    ${login_data.valid_users.standard_user.username}    ${login_data.valid_users.standard_user.password}

TC002_Login_With_Invalid_Username
    [Documentation]    ทดสอบ login ด้วย username ที่ไม่ถูกต้อง
    [Tags]    login    negative
    Create Chrome Webdriver  ${base_url}
    Login With Invalid Credentials    ${login_data.invalid_users.invalid_user.username}    ${login_data.invalid_users.invalid_user.password}
    Verify Login Failed    ${login_data.error_messages.username_password_mismatch}

TC003_Login_With_Invalid_Password
    [Documentation]    ทดสอบ login ด้วย password ที่ไม่ถูกต้อง
    [Tags]    login    negative
    Create Chrome Webdriver  ${base_url}
    Login With Invalid Credentials    ${login_data.invalid_users.wrong_password.username}    ${login_data.invalid_users.wrong_password.password}
    Verify Login Failed    ${login_data.error_messages.username_password_mismatch}

TC004_Login_With_Locked_User
    [Documentation]    ทดสอบ login ด้วย user ที่ถูก lock
    [Tags]    login    negative
    Create Chrome Webdriver  ${base_url}
    Login With Invalid Credentials    ${login_data.invalid_users.locked_out_user.username}    ${login_data.invalid_users.locked_out_user.password}
    Verify Login Failed    ${login_data.error_messages.locked_user}

TC005_Login_With_Empty_Credentials
    [Documentation]    ทดสอบ login โดยไม่ใส่ username และ password
    [Tags]    login    negative
    Create Chrome Webdriver  ${base_url}
    Login With Invalid Credentials    ${login_data.empty_credentials.username}    ${login_data.empty_credentials.password}
    Verify Login Failed    ${login_data.error_messages.username_required}
