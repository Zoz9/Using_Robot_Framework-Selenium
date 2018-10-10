*** Settings ***

Library  Selenium2Library

Suite Teardown  Close All Browsers


*** Variables ***

${searchword}   iPhone 7


*** Test Cases ***
test1
    Search press enter
    url click number       1

test2
    Search press button
    url click number       1
*** Keywords ***

Search press enter
    Create Webdriver  Chrome
	Go to  https://hotline.ua/
	input text      name=q       ${searchword}
	Press Key       id=doSearch    \\13
	sleep  2s

Search press button
    Create Webdriver  Chrome
	Go to  https://hotline.ua/
	sleep  1s
	input text      name=q       ${searchword}
	click button    id=doSearch
	sleep  2s

url click number
    [Arguments]  ${searhlinc}
    Wait Until Element is Visible     xpath=//a[@data-tracking-id="catalog-10"]
    ${AllLinksCount} =    Get Matching Xpath Count    xpath=//a[@data-tracking-id="catalog-10"]
    click element    xpath=(//a[@data-tracking-id="catalog-10"])[${searhlinc}]