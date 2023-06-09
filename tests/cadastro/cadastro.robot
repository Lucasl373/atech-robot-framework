*** Settings ***
#Library         Browser
#Library        FakerLibrary > "Serve para preencher emails aleatórios"
#Library         resources/libs/mongo.py
#Resource        resources/base.robot

Resource    C:\QAx\projects\mark85-robot\resources\base.robot



*** Variables ***
&{user}=    name=Lucas Silva    email=lucasl373@gmail.com    password=L12345
&{user_Duplicado}=    name=Carlos Castro    email=carlos@gmail.com    password=123456
&{user_vazio}=    name=${EMPTY}    email=${EMPTY}    password=${EMPTY}
&{msg_erro}=    msg01=Informe seu nome completo    msg02=Informe seu e-email    msg03=Informe uma senha com pelo menos 6 digitos



*** Test Cases ***
Deve cadastrar um novo usuário.
    
    Remove User By Email    ${user}[email]
    Start session
    Go to signup
    Registrar usuarios no portal    ${user}
    Notice Should be    Boas vindas ao Mark85, o seu gerenciador de tarefas.
    Sleep    2
            
    #${email}    Free Email > "Serve para preencher emails aleatórios"
    #Fill Text   css=input[name=email]       $${email} > "Serve para preencher emails aleatórios"
  
    

    

Usuário já existente Duplicado

    Remove User By Email    ${user_Duplicado}[email]
    Insert User             ${user_Duplicado}
    Start session
    Go to signup
    #Registrar usuarios no portal    ${user_Duplicado}
    #Sleep    2
    Registrar usuarios no portal    ${user_Duplicado}
    Notice Should be    Oops! Já existe um cadastro com e-mail informado.
    Sleep    2

Campos Obrigatorios em branco
    [Tags]    Branco
    Start session
    Go to signup
    Registrar usuarios no portal    ${user_vazio}
    Notice msgs campos em branco    ${msg_erro}
    Sleep    2