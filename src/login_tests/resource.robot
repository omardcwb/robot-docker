*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
#Library           XvfbRobot

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        headlesschrome      
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***
Open Browser To Login Page
#    Start Virtual Display    1920    1080
    Wait Until Keyword Succeeds     3   2   Open Browser    ${LOGIN URL}    ${BROWSER}   options=add_argument("--disable-gpu"); add_argument("--disable-dev-shm-usage"); add_argument("--no-sandbox")
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
   Capture Page Screenshot
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page
