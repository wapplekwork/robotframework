*** Settings ***
Library    SeleniumLibrary
*** Variables ***
# ${CHROME_DRIVER_PATH_WINS}    C:/path/to/chromedriver.exe
${CHROME_DRIVER_PATH_WINS}      C:/Users/watsana/Documents/chrome-win32/chromedriver.exe
${CHROME_DRIVER_PATH_LINUX}   /usr/bin/chromedriver
${CHROME_DRIVER_PATH_MAC}     /usr/local/bin/chromedriver

*** Keywords ***
Create Chrome Webdriver
    [Documentation]  create new chrome driver with options
    [Arguments]    ${url}   ${speed}=0.05       ${headless}=${headless}
    ${system}=    Evaluate    platform.system()    platform
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()  sys  
   
    ${prefs}=    Create Dictionary    credentials_enable_service=${False}    profile.password_manager_enabled=${False}
  
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${chrome_options}    add_argument    --disable-infobars
    Call Method    ${chrome_options}    add_argument    --disable-popup-blockin
    Call Method    ${chrome_options}    add_argument    --disable-password-manager-reauthentication
    Call Method    ${chrome_options}    add_argument    --disable-password-manager
    Call Method    ${chrome_options}    add_argument    --incognito

    ${exclude_switches_list}=    Create List    enable-automation    enable-logging
    Call Method    ${chrome_options}    add_experimental_option    excludeSwitches    ${exclude_switches_list}

    IF    "${headless}".upper() == "TRUE"
        Call Method  ${chrome_options}  add_argument  --headless
    END
    
    Call Method  ${chrome_options}  add_argument  --test-type
    Call Method  ${chrome_options}  add_argument  --lang\=en-us
    Call Method  ${chrome_options}  add_argument  --ignore-certificate-errors
    Call Method  ${chrome_options}  add_argument  --disable-gpu
    Call Method  ${chrome_options}  add_argument  --no-sandbox
    Call Method  ${chrome_options}  add_argument  --window-size\=1600,1200
    Call Method  ${chrome_options}  add_argument  --use-fake-device-for-media-stream
    Call Method  ${chrome_options}  add_argument  --use-fake-ui-for-media-stream
    
    Run Keyword If    '${system}'=='Linux'    Run Keywords
    ...    Call Method    ${chrome_options}    add_argument    --test-type
    ...    AND    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    ...    AND    Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...    AND    Call Method    ${chrome_options}    add_argument    --headless
    ...    AND    Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...    AND    Call Method    ${chrome_options}    add_argument    --no-sandbox
    ...    AND    Call Method    ${chrome_options}    add_argument    --window-size\=1600,1200
    ...    AND    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    ${driver_path}=    Run Keyword If    '${system}'=='Linux'    Set Variable    ${CHROME_DRIVER_PATH_LINUX}
    ...    ELSE IF    '${system}'=='Windows'  Set Variable    ${CHROME_DRIVER_PATH_WINS}
    ...    ELSE IF    '${system}'=='Darwin'   Set Variable    ${CHROME_DRIVER_PATH_MAC}
    ...    ELSE     fail    Not support system : ${system}
    ${kwargs}=    BuiltIn.Create Dictionary    executable_path=${driver_path}
    Open Browser    ${url}    Chrome    options=${chrome_options}    executable_path=${driver_path}
    Run Keyword If    '${system}'=='Windows'  SeleniumLibrary.Maximize Browser Window
    Set Selenium Speed    ${speed}
    # SeleniumLibrary.Go To    ${url}
    

Teardown Step
    BuiltIn.Run Keyword If Test Failed      SeleniumLibrary.Capture Page Screenshot
    SeleniumLibrary.Close all browsers
