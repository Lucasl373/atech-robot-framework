*** Settings ***
Library   Browser
Documentation        Pagina de Cadastro

*** Keywords ***
Go to signup
    Go To    http://localhost:3000/signup
    Get Text    css=form h1    equal    Faça seu cadastro

Registrar usuarios no portal
    [Arguments]        ${user}

    Fill Text   css=input[name=name]        ${user}[name]
    Fill Text   css=input[name=email]       ${user}[email]
    Fill Text   css=input[name=password]    ${user}[password]
    Click       css=button[type=submit] >> text=Cadastrar

Notice Should be
    [Arguments]    ${message}
    ${notice}    Set Variable    css=.notice p
    
    Wait For Elements State    ${notice}    visible    5
    
    Get Text    ${notice}    equal    ${message}
Notice msgs campos em branco
    [Arguments]    ${msg_erro}
    ${msg_erro_1}    Set Variable    css=Small[class=alert-error] >> text=Informe seu nome completo
    ${msg_erro_2}    Set Variable    css=Small[class=alert-error] >> text=Informe seu e-email
    ${msg_erro_3}    Set Variable    css=Small[class=alert-error] >> text=Informe uma senha com pelo menos 6 digitos

    Get Text    ${msg_erro_1}    equal    ${msg_erro}[msg01]
    Get Text    ${msg_erro_2}    equal    ${msg_erro}[msg02]
    Get Text    ${msg_erro_3}    equal    ${msg_erro}[msg03]
