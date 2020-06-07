*** Settings ***
Resource      resource.robot
Test Teardown    Close Browser

*** Test Cases ***
Detect Default Language (English) Of Browser
    Open Browser  ${BASE_URL}  ${BROWSER}
    Page Language Should Be English

Detect (Simplified) Chinese Language Of Browser
    Open Chrome With Zh Locale  ${BASE_URL}
    Page Language Should Be Simplified Chinese

*** Keywords ***
Page Language Should Be English
    Page Should Contain  Current Version

Page Language Should Be Simplified Chinese
    Page Should Contain  当前版本

*** Keywords ***
Open Chrome With Zh Locale
    [Arguments]     ${url}
    [Documentation]     Starts the Google Chrome browser.
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method     ${options}     add_argument     --user-data-dir\=robottests/ChromeProfiles/zh-cn
    Create WebDriver     Chrome     chrome_options=${options}
    Go To     ${url}
