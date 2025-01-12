*** Settings ***
Library    SeleniumLibrary

Suite Setup    เปิดเว็บเบราว์เซอร์       
Test Setup     เข้า Google
Suite Teardown    Close All Browsers

Test Template    ค้นหาและตรวจสอบ

*** Variables ***
${URL}    https://www.google.com 
${BROWSER}    chrome

*** Test Cases ***                             คำค้น    ผลค้นหา
ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์    PIM    สถาบันการจัดการปัญญาภิวัฒน์
ทดสอบใส่คำค้น AI ควรเจอ OpenAI                    AI    OpenAI
ทดสอบใส่คำค้น DMK ควรเจอ สนามบินดอนเมือง            DMK    สนามบินดอนเมือง

*** Keywords ***
เปิดเว็บเบราว์เซอร์
    Open Browser    browser=${BROWSER}

เข้า Google
    Go To    ${URL}

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
