*** Settings ***
Documentation    Tentativa de cadastro com senha curta

Resource   C:\QAx\projects\mark85-robot\resources\base.robot

Test Template        Short password

*** Test Cases ***
Não deve logar com 1 digito    a
Não deve logar com 2 digito    a2
Não deve logar com 3 digito    a23
Não deve logar com 4 digito    a234
Não deve logar com 5 digito    a2345




*** Keywords ***
Short password
    [Arguments]    ${short_pass}

    &{user}        Create Dictionary
...    name=Steve Jobs
...    email=jobs@gmail.com
...    password=${short_pass}

    Start session
    Go to signup
    Registrar usuarios no portal    ${user}
    Notice msgs Senha incorreta    Informe uma senha com pelo menos 6 digitos
    Sleep    2

