*** Settings ***

Resource  resource.robot

Test Setup  Enter Translation
Test TearDown  Close Browser

*** Test Cases ***

Checking All Language Images  [Template]  Can switch to other language
   Chinese       zh-cn
   Vietnamese    vi
   Japanese      jp
   Korean        kr
   Thai          th
   French        fr
   German        de
   Spanish       es
   Bulgarian     bg
   Russian       ru

Default Translation Should be Chinese
    Confirm Translation Should Be  zh-cn

*** Keywords ***
Can switch to other language  [Arguments]  ${button}  ${language}
    Click Button  ${button} 
    Confirm Translation Should Be  ${language}

Enter Translation
    Open Browser  ${BASE_URL}  ${BROWSER}
    Click Link  Translations
    Wait Until Element Is Visible    overview_translated

Confirm Translation Should Be  [Arguments]  ${language}
    Confirm Translation Is Shown  ${language}
    Confirm Links to PDF  ${language}

Confirm Translation Is Shown  [Arguments]  ${language}
    ${overview_picture}=  Catenate  SEPARATOR=  /overview/  ${language}  _scrum_overview.png
    Page Should Contain Image    ${overview_picture}    

Confirm Links to PDF  [Arguments]  ${language}
    Confirm Link With Language And Version  ${language}  1
    Confirm Link With Language And Version  ${language}  2

Confirm Link With Language And Version  [Arguments]  ${language}  ${version}
    ${overview}=  Catenate  SEPARATOR=    /overview/  ${language}  _scrum_overview  ${version}  .pdf
    Page Should Contain Link    ${overview}    
