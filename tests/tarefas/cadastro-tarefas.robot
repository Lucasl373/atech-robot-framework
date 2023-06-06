*** Settings ***
Documentation        Cadastro de Tarefas
Library    JSONLibrary
Library   Browser
Resource    ../../resources/base.robot


*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    ${data}    get fixture    tasks    create    
    
    Create new user    ${data}[user]
    Login session      ${data}[user]

    Go to task form
    Submit task form    ${data}[task]
    Task should be registered    ${data}[task][name]


    Sleep    5

Deve remover uma tarefa indesejada
    ${data}    get fixture    tasks    remove

    Create new user    ${data}[user]
    Login session      ${data}[user]

    Go to task form
    Submit task form    ${data}[task]
    Task should be registered    ${data}[task][name]
    Remove Task    ${data}[task][name]
    Task should not exist    ${data}[task][name]
    Sleep    5