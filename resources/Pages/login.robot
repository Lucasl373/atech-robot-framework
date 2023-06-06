*** Settings ***
Documentation        Página de Login
Library    Browser

*** Keywords ***
Submit Login Form

    [Arguments]        ${user}

    Fill Text    css=input[name=email]        ${user}[email]
    Fill Text    css=input[name=password]     ${user}[password]

    Click    css=button[type=submit] >> text=Entrar