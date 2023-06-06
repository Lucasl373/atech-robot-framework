*** Settings ***
Documentation    Helpers
Library    libs/mongo.py
Library   JSONLibrary

*** Keywords ***
Create new user
    [Arguments]    ${user}

    Remove User By Email    ${user}[email]
    Insert User              ${user}

get fixture
#keyword que serve para criar o usuário e as tarefas utilizando o jason e o excutável tasks.robot

    [Arguments]        ${filename}        ${scenario}

    ${data}    Load Json From File        ../../resources/fixtures/${filename}.json    encoding=utf-8

    [Return]    ${data}[${scenario}]
