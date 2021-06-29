*** Settings ***
Library    SeleniumLibrary    

Suite Setup       Log    I am inside Testsuite SetUp
Suite Teardown    Log    I am inside Testsuide Teardown  
Test Setup        Log    I am inside Test SetUp      
Test Teardown     Log    I am inside Test Teardown     

Default Tags    sanity 

*** Test Cases ***
MyFirstTest
    [Tags]    smoke
    Log  Im inside first test
    
MySecondTest
    [Tags]    example
    Log  Im inside second test
    Set Tags    regression1
    Remove Tags    regression1
    
MyThirdTest
    Log  Im inside third test
    
    
FirstSeleniumTest
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation step by step   
    Click Button    name=btnK 
    Sleep    5  
    Close Browser
    Log    Test Complete! 
    
SampleLoginTest
    [Documentation]    This is a sample login test
    Open Browser      ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW
    Click Element     id=welcome    
    Click Element     link=Logout 
    Close Browser
    Log               Test completed... 

*** Variables ***
${URL}         https://opensource-demo.orangehrmlive.com/  
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text        id=txtUsername    ${CREDENTIALS}[0]
    Input Password    id=txtPassword    ${LOGINDATA}[password]  
    Click Button      id=btnLogin 
    

