# Robotframework-Seleniumlibrary Part 02

## Keywords

Keywords Section: `Creating user keywords` from existing lower-level keywords

```robot
*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Test Cases ***
ทดสอบค้นหา PIM ควรจะต้องเจอ สถาบันการจัดการปัญญาภิวัฒน์
    Open Browser    url=https://www.google.com    browser=chrome
    Input Text    id=APjFqb    text=PIM
    Press Keys    None    RETURN
    Wait Until Page Contains    สถาบันการจัดการปัญญาภิวัฒน์


*** Keywords ***
เข้า google และใส่คำค้น

```

## In Action

1. Create User Keywords `เข้า google และใส่คำค้น`

   ```robot
   *** Test Cases ***
   ทดสอบค้นหา PIM ควรจะต้องเจอ สถาบันการจัดการปัญญาภิวัฒน์
       Open Browser    url=https://www.google.com    browser=chrome
       Input Text    id=APjFqb    text=PIM
       Press Keys    None    RETURN
       Wait Until Page Contains    สถาบันการจัดการปัญญาภิวัฒน์


   *** Keywords ***
   เข้า google และใส่คำค้น

   ```

2. Run Test

   ```sh
   robot google.robot
   ```

3. Create User Keywords `ตรวจสอบผลการค้นหา`

   ```robot
   *** Keywords ***
   เข้า google และใส่คำค้น
      ...

   ตรวจสอบผลการค้นหา
      ...
   ```

4. Run Test

   ```sh
   robot google.robot
   ```

5. Create `User Keyword Arguments`

   ```robot
   *** Keywords ***
   เข้า google และใส่คำค้น
      [Argumensts]
      ...
   ```

6. Run Test

   ```sh
   robot google.robot
   ```

## Variables

1. Create Variable call `URL`

   ```robot
   *** Settings ***
   Library    SeleniumLibrary

   *** Variables ***
   ${URL}
   ```

2. Run Test

   ```sh
   robot google.robot
   ```

3. Run Test with `-v`

   ```sh
   robot -v URL:https://www.google.co.th google.com
   ```
