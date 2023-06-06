*** Settings ***
Documentation        Tudo começa aqui

Library  Browser
Library  libs/mongo.py
Resource       Pages/signup.robot
Resource       helpers.robot
Resource       Pages/componentes/nav.robot
Resource       Pages/componentes/notice.robot
Resource       Pages/tasks.robot
Resource       Pages/login.robot

*** Keywords ***
Start session

    New Browser    browser=chromium    headless=${false}
    New Page       http://localhost:3000

Login session
    [Arguments]        ${user}
    
    Start session
    Submit Login Form    ${user}
    Sleep    2
    User should be logged in    ${user}[name]
    Sleep    3