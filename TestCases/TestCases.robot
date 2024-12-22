*** Settings ***

Library    SeleniumLibrary
Library     BuiltIn

*** Variables ***

${LOGIN URL}      https://www.guru99.com/
${BROWSER}        Chrome

*** Test Cases ***

Case1. Open Browser to launch url

    Open Browser   ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    sleep   5s

Case2. Verify the Title

    Element Should Be Visible   (//img[@class='custom-logo' and @alt='Guru99'])[1]
    Element Should Be Visible   //a[@href='/' and text()='Home']

Case3. Navigate to JUnit

    Element Should Be Visible   //a[@href='/software-testing.html']
    Click Element   //a[@href='/software-testing.html']
    sleep   5s
    Element Should Be Visible   //ul[@class='sub-menu clicked']//a[text()='JUnit' and @href='/junit-tutorial.html']
    Click Element   //ul[@class='sub-menu clicked']//a[text()='JUnit' and @href='/junit-tutorial.html']
    sleep   5s
    Log to Console      Navigated to JUnit Successfully

Case4. Verify Page entry Title Text
    
    Element Should Be Visible   //*[@id="post-862"]//h1
    ${enteryTitle}=  Get Text     //*[@id="post-862"]//h1
    Log To Console    ${enteryTitle}
    Element Text Should Be    //*[@id="post-862"]//h1    JUnit Tutorial for Beginners: Learn in 3 Days
    Log To Console     Verify Page entry Title Text