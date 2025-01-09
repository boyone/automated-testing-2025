# Robotframework-Seleniumlibrary Part 03

## Test Templates

Test templates convert normal `keyword-driven` test cases into `data-driven` tests. Whereas the body of a keyword-driven test case is constructed from keywords and their possible arguments, test cases with template contain only the arguments for the template keyword. Instead of repeating the same keyword multiple times per test and/or with all tests in a file, it is possible to use it only per test or just once per file.

1. [Template]

   ```robot
   *** Test Cases ***
   ค้นหาด้วยคำค้นตาม template
      [Template]    ค้นหาด้วยคำค้น
      PIM    สถาบันการจัดการปัญญาภิวัฒน์
      AI    OpenAI


   *** Keywords ***
   ค้นหาด้วยคำค้น
      [Arguments]    ${keyword}    ${expected}
      เข้า google และใส่คำค้น    ${keyword}
      ตรวจสอบผลการค้นหา    ${expected}
   ```

2. Test Template

   ```robot
   *** Test Cases ***    Keyword    Expected
   ทดสอบค้นหา PIM ควรจะต้องเจอ สถาบันการจัดการปัญญาภิวัฒน์    PIM    สถาบันการจัดการปัญญาภิวัฒน์
   ทดสอบค้นหา AI ควรจะเจอ OpenAI    AI    OpenAI


   *** Keywords ***
   ค้นหาด้วยคำค้น
      [Arguments]    ${keyword}    ${expected}
      เข้า google และใส่คำค้น    ${keyword}
      ตรวจสอบผลการค้นหา    ${expected}
   ```

## In Action

### [Template]: Template under TestCase

1. Create file call `google-template.robot` (copy from `google.robot`)
2. Create User Keywords `ค้นหาด้วยคำค้น`

   ```robot
   *** Keywords ***
   ค้นหาด้วยคำค้น
       [Arguments]    ${keyword}    ${expected}
       เข้า google และใส่คำค้น    ${keyword}
       ตรวจสอบผลการค้นหา    ${expected}

   ```

3. Remove All TestCases
4. Add New TestCase call `ค้นหาด้วยคำค้นตาม template` with `[Template]`

   ```robot
   *** Test Cases ***
   ค้นหาด้วยคำค้นตาม template
      [Template]    ค้นหาด้วยคำค้น
      PIM    สถาบันการจัดการปัญญาภิวัฒน์
      AI    OpenAI
   ```

5. Run Test

   ```sh
   robot google-template.robot
   ```

### Test Template: Template under Settings Section

1. Create file call `google-test-template.robot` (copy from `google.robot`)
2. Create User Keywords `ค้นหาด้วยคำค้น`

   ```robot
   *** Keywords ***
   ค้นหาด้วยคำค้น
       [Arguments]    ${keyword}    ${expected}
       เข้า google และใส่คำค้น    ${keyword}
       ตรวจสอบผลการค้นหา    ${expected}

   ```

3. Remove All TestCases
4. Add new testcase

   ```robot
   *** Test Cases ***    Keyword    Expected
   ทดสอบค้นหา PIM ควรจะต้องเจอ สถาบันการจัดการปัญญาภิวัฒน์    PIM    สถาบันการจัดการปัญญาภิวัฒน์
   ทดสอบค้นหา AI ควรจะเจอ OpenAI    AI    OpenAI
   ```

5. Set `Test Template` at `Settings` Section

   ```robot
   *** Settings ***
   Library             SeleniumLibrary

   Test Template       ค้นหาด้วยคำค้น
   ```

6. Run Test

   ```sh
   robot google-test-template.robot
   ```

---

## Setup/Teardown

4. Suite Setup/Suite Teardown

   ```robot
   *** Settings ***
   Library             SeleniumLibrary

   Suite Setup         Open Browser    browser=chrome
   Suite Teardown      Close All Browsers
   Test Setup          เข้า google
   Test Template       ค้นหาด้วยคำค้น
   ```

---

## In Action

### Test Setup/Test Teardown

1. Create file call `google-test-setup.robot` (copy from `google-test-template.robot`)
2. Split `ค้นหาด้วยคำค้น` keyword into following keywords `เข้า google` and `ใส่คำค้น`

   ```robot
   *** Keywords ***
   ค้นหาด้วยคำค้น
      [Arguments]    ${keyword}    ${expected}
      เข้า google
      ใส่คำค้น    ${keyword}
      ตรวจสอบผลการค้นหา    ${expected}

   เข้า google
      Open Browser    url=${URL}    browser=chrome

   ใส่คำค้น
      [Arguments]    ${keyword}
      Input Text    id=APjFqb    text=${keyword}
      Press Keys    None    RETURN
   ```

3. Remove `เข้า google` keyword from `ค้นหาด้วยคำค้น` keyword
4. Set `Test Setup` and `Test Teardown` at `*** Settings ***`

   - `Test Setup          เข้า google`
   - `Test Teardown       Close Browser`

     ```robot
     *** Settings ***
     Library             SeleniumLibrary

     Test Setup          เข้า google
     Test Teardown       Close Browser
     Test Template       ค้นหาด้วยคำค้น
     ```

5. Run Test

   ```sh
   robot google-test-setup.robot
   ```

### Suite Setup/Suite Teardown

1. Create file call `google-suite-setup.robot` (copy from `google-test-template.robot`)
2. Split `ค้นหาด้วยคำค้น` keyword into following keywords `เข้า google` and `ใส่คำค้น`

   ```robot
   *** Keywords ***
   ค้นหาด้วยคำค้น
      [Arguments]    ${keyword}    ${expected}
      เข้า google
      ใส่คำค้น    ${keyword}
      ตรวจสอบผลการค้นหา    ${expected}

   เข้า google
      Open Browser    url=${URL}    browser=chrome

   ใส่คำค้น
      [Arguments]    ${keyword}
      Input Text    id=APjFqb    text=${keyword}
      Press Keys    None    RETURN
   ```

3. Replace `เข้า google` with

   ```robot
   *** Keywords ***
   เข้า google
       Go To    url=${URL}
   ```

4. Set `Suite Setup` and `Suite Teardown` at `*** Settings ***`

   - `Suite Setup          Open Browser browser=chrome`
   - `Suite Teardown       Close All Browsers`

     ```robot
     *** Settings ***
     Library             SeleniumLibrary

     Suite Setup         Open Browser    browser=chrome
     Suite Teardown      Close All Browsers
     Test Template       ค้นหาด้วยคำค้น
     ```

---

## Resources

1. Create file call `google-resource.robot` (copy from `google-suite-setup.robot`)
2. Create file call `keywords.resource`
3. Move `Library     SeleniumLibrary` 
4. Move `Keywords Section` to `keywords.resource`
5. Move `Variables Section` to `keywords.resource`