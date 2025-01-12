*** Settings ***
Suite Setup    เปิดเว็บเบราว์เซอร์       
Test Setup     เข้า Google
Suite Teardown    Close All Browsers
Test Template    ค้นหาและตรวจสอบ
Resource    keywords.resource

*** Test Cases ***                             คำค้น    ผลค้นหา
ทดสอบใส่คำค้น PIM ควรเจอ สถาบันการจัดการปัญญาภิวัฒน์    PIM    สถาบันการจัดการปัญญาภิวัฒน์
ทดสอบใส่คำค้น AI ควรเจอ OpenAI                    AI    OpenAI
ทดสอบใส่คำค้น DMK ควรเจอ สนามบินดอนเมือง            DMK    สนามบินดอนเมือง
