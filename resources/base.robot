*** Settings ***
Documentation        Tudo começa aqui

Library  Browser
Library  libs/mongo.py
Resource       Pages/signup.robot
Resource       helpers.robot
Resource       Pages/components.robot
Resource       Pages/tasks.robot

*** Keywords ***
Start session

    New Browser    browser=chromium    headless=${false}
    New Page       http://localhost:3000