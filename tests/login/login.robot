*** Settings ***
Documentation    Cenarios de teste de Login

Resource    ../../resources/base.robot
Resource    ../../resources/Pages/login.robot

*** Test Cases ***
Deve logar com sucesso
    ${user}    Create Dictionary
    ...    name=Lucas Silva
    ...    email=lucasl373@gmail.com
    ...    password=L12345
    
    Create new user    ${user}
    
    Start session 
    Submit Login Form       ${user}
    Sleep    2
    User should be logged in    ${user}[name]
    Sleep    3

Não deve logar com senha incorreta
    ${user1}    Create Dictionary
    ...    name=Arthur Silva
    ...    email=arthur_silva@gmail.com
    ...    password=A12345
    
    ${user2}    Create Dictionary
    ...    name=Arthur Silva
    ...    email=arthur_silva@gmail.com
    ...    password=A1234500000000000
    
    Create new user    ${user1}
    Start session
    Submit Login Form       ${user2}
    Notice Should be    Ocorreu um erro ao fazer login, verifique suas credenciais.
