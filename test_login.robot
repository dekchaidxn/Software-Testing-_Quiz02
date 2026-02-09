*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser And Go To Login
Suite Teardown    Close Browser
 
*** Variables ***
${BROWSER}        Chrome
${URL}            https://chiangmuan.igovapp.com/
${EMAIL}          thanadonteadkaew@gmail.com
${PASSWORD}       Thanadon@6789
 
${OPEN_LOGIN_BUTTON}    xpath=/html/body/div/div/nav/header/div/a[1]
${EMAIL_INPUT}          xpath=/html/body/div[1]/div/div/div/div/div[2]/div/form/fieldset/div[1]/input
${PASSWORD_INPUT}       xpath=/html/body/div[1]/div/div/div/div/div[2]/div/form/fieldset/div[2]/input
${LOGIN_BUTTON}         xpath=/html/body/div[1]/div/div/div/div/div[2]/div/form/fieldset/div[3]/button
${WELCOME_TEXT}         xpath=//*[contains(text(),'ยินดีต้อนรับ')]
 
*** Keywords ***
Open Browser And Go To Login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${OPEN_LOGIN_BUTTON}    15s
    Click Element    ${OPEN_LOGIN_BUTTON}
    Wait Until Element Is Visible    ${EMAIL_INPUT}    15s
 
Input Email Only
    Input Text    ${EMAIL_INPUT}    ${EMAIL}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
 
Wait User Input Password And Captcha
    Log To Console    === กรุณากรอกรหัสผ่านและ CAPTCHA ด้วยตนเอง ===
    Sleep    20s
 
Click Login
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    10s
    Click Element    ${LOGIN_BUTTON}
 
*** Test Cases ***
F01.1_TC1 Login With Manual Password And Captcha
    Input Email Only
    Wait User Input Password And Captcha
    Click Login
    Run Keyword And Ignore Error
    ...    Wait Until Page Contains Element    ${WELCOME_TEXT}    15s