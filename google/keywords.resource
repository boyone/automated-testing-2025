*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://www.google.com 
${BROWSER}    chrome


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