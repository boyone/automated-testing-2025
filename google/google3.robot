*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.google.com 
${BROWSER}    chrome

*** Test Cases ***
ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา    PIM
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    สถาบันการจัดการปัญญาภิวัฒน์

ทดสอบใส่คำค้น AI ควรเจอ OpenAI
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา    AI
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    OpenAI

ทดสอบใส่คำค้น DMK ควรเจอ สนามบินดอนเมือง
    เปิดเว็บเบราว์เซอร์และเข้า Google
    ใส่คำค้นหา    DMK
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    สนามบินดอนเมือง

*** Keywords ***
เปิดเว็บเบราว์เซอร์และเข้า Google 
    Open Browser    url=${URL}    browser=${BROWSER}

ใส่คำค้นหา
    [Arguments]    ${คำค้น}
    Input Text    name=q    ${คำค้น}

กดปุ่ม Enter
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหา
    [Arguments]    ${ผลค้นหา}
    Wait Until Page Contains    ${ผลค้นหา}
