*** Settings ***
Documentation        Tudo começa aqui

Library  Browser
Library  libs/mongo.py
Resource   Pages/signup.robot

*** Keywords ***
Start session

    New Browser    browser=chromium    headless=${false}
    New Page       http://localhost:3000