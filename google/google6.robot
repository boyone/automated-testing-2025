*** Settings ***
Library    SeleniumLibrary

Test Setup    เปิดเว็บเบราว์เซอร์และเข้า Google
Test Teardown    Close Browser

Test Template    ค้นหาและตรวจสอบ

*** Variables ***
${URL}    https://www.google.com 
${BROWSER}    chrome

*** Test Cases ***                             คำค้น    ผลค้นหา
ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์    PIM    สถาบันการจัดการปัญญาภิวัฒน์
ทดสอบใส่คำค้น AI ควรเจอ OpenAI                    AI    OpenAI
ทดสอบใส่คำค้น DMK ควรเจอ สนามบินดอนเมือง            DMK    สนามบินดอนเมือง

*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google 
    Open Browser    url=${URL}    browser=${BROWSER}

ค้นหาและตรวจสอบ
    [Arguments]    ${คำค้น}    ${ผลค้นหา}
    ใส่คำค้นหา    ${คำค้น}
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    ${ผลค้นหา}

ใส่คำค้นหา
    [Arguments]    ${คำค้น}
    Input Text    name=q    ${คำค้น}

กดปุ่ม Enter
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหา
    [Arguments]    ${ผลค้นหา}
    Wait Until Page Contains    ${ผลค้นหา}
