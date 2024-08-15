*** Settings ***
Library    SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${DEBUG_PORT}    9222
${CHROME_PROFILE_PATH}    C:\\Users\\Muzammil\\AppData\\Local\\Google\\Chrome\\User Data



*** Keywords ***

Open Chrome Browser in Debug mode and connect
    [Documentation]    keyword opens chrome browser in debug mode
    [Arguments]    ${url}   
    Close any open chrome browser instance 
    ${rc}     ${output}   Run And Return Rc And Output    start chrome.exe -remote-debugging-port=9222
    Log    ${output}
    Sleep    2s
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_experimental_option    debuggerAddress    127.0.0.1:${DEBUG_PORT}
    Call Method     ${chrome_options}    add_argument    --headless
    Create WebDriver    Chrome    options=${chrome_options}
    Go To    ${url}
    Set Browser Implicit Wait   10s 

Open Headless Chrome With User Profile
    
    [Arguments]    ${url}
    Close any open chrome browser instance
    Sleep    2s
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --user-data-dir\=${CHROME_PROFILE_PATH}
    Call Method    ${chrome_options}    add_argument    --headless
    # Create WebDriver instance with specified options
    Create WebDriver    Chrome    options=${chrome_options}
    # Example: Open a URL
    Go To      ${url}
    

Close any open chrome browser instance
    Run   taskkill /IM chrome.exe /F
    Close All Browsers
    





