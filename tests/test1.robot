*** Settings ***

Library  Selenium2Library

Suite Teardown  Close All Browsers


*** Variables ***

${searchword}   iPhone 7


*** Test Cases ***
test1
    Search
    press enter
    url click number       1

test2
    Search
    press button
    url click number       1
*** Keywords ***

Search
    Create Webdriver  Chrome
	Go to  https://hotline.ua/
	input text      name=q       ${searchword}


press enter
    Press Key       id=doSearch    \\13

press button
	click button    id=doSearch

url click number
    [Arguments]  ${searhlinc}
    Wait Until Element is Visible     xpath=//a[@data-tracking-id="catalog-10"]
    ${AllLinksCount} =    Get Matching Xpath Count    xpath=//a[@data-tracking-id="catalog-10"]
    click element    xpath=(//a[@data-tracking-id="catalog-10"])[${searhlinc}]