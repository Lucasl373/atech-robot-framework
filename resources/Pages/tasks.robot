*** Settings ***
Documentation    Página de gestão de tarefas

Library  Browser

*** Keywords ***
Go to task form
    Click    css=a[href="/create"]

    #Wait For Elements State    h1    visible    5
    #Get Text    css=h1    equal    Cadastrar Tarefa

    Wait For Elements State
    ...    css=h1 >> text=Cadastrar Tarefa
    ...    visible    5
    
Submit task form
    [Arguments]        ${task}
    Fill Text    css=input[placeholder="Nome da tarefa"]    ${task}[name]
    #Fill Text    css=input[placeholder="Nome da tarefa"]    ${task}[name]

    FOR  ${tag}  IN  @{task}[tags]
        
        Fill Text    css=input[name=tags]    ${tag}
        Keyboard Key    press    Enter
    
    END
    Click    css=button[type=submit] >> text=Cadastrar

Task should be registered
    [Arguments]    ${task_name}
    
    Wait For Elements State
    
    ...    css=.task-item >> text=${task_name}
    ...    visible    5

Task should not exist
    [Arguments]    ${task_name}
    
    Wait For Elements State
    
    ...    css=.task-item >> text=${task_name}
    ...    detached    5

Remove Task
    [Arguments]    ${task_name}

    Click    xpath=//strong[text()="${task_name}"]/..//button[@class="task-remove"]

Marcar Task
    [Arguments]    ${task_name}

    Click    xpath=//strong[text()="${task_name}"]/..//button[@class="item-toggle"]
    Wait For Elements State
    
    ...    //strong[text()="${task_name}"]/..//button[@class="item-toggle-selected"]
    ...    visible    5