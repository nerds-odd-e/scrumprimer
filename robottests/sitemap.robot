*** Settings ***
Resource    resource.robot
Test Teardown    Close Browser

*** Test Cases ***
Should have a sitemap.xml file
    ${url}=    Catenate    SEPARATOR=    ${BASE_URL}    /sitemap.xml
    Open Sitemap    ${url}
    Page Should Contain    http://scrumprimer.org/

Should have a sitemap.xml entry for /
    ${url}=    Catenate    SEPARATOR=    ${BASE_URL}    /sitemap.xml
    Open Sitemap    ${url}
    Page Should Contain    http://scrumprimer.org/

Should have a sitemap.xml entry for /translations
    ${url}=    Catenate    SEPARATOR=    ${BASE_URL}    /sitemap.xml
    Open Sitemap    ${url}
    Page Should Contain    http://scrumprimer.org/translations

Should have a sitemap.xml entry for /overview
    ${url}=    Catenate    SEPARATOR=    ${BASE_URL}    /sitemap.xml
    Open Sitemap    ${url}
    Page Should Contain    http://scrumprimer.org/overview

Should have a sitemap.xml entry for /anime
    ${url}=    Catenate    SEPARATOR=    ${BASE_URL}    /sitemap.xml
    Open Sitemap    ${url}
    Page Should Contain    http://scrumprimer.org/anime

Should have a sitemap.xml entry for /about
    ${url}=    Catenate    SEPARATOR=    ${BASE_URL}    /sitemap.xml
    Open Sitemap    ${url}
    Page Should Contain    http://scrumprimer.org/about

Should have a sitemap.xml entry for /contact
    ${url}=    Catenate    SEPARATOR=    ${BASE_URL}    /sitemap.xml
    Open Sitemap    ${url}
    Page Should Contain    http://scrumprimer.org/contact


*** Keywords ***
Open Sitemap
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
