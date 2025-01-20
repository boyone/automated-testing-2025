*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEV_URL}    http://165.22.255.65/product/list
${SIT_URL}    http://159.223.89.151/product/list
${UAT_URL}    http://134.209.105.245/product/list

*** Test Cases ***
ทดสอบซื้อสินค้าเลือกวิธีจัดส่งสินค้าเป็น Kerry และชำระเงินด้วย credit card ของ visa และชำระเงินสำเร็จ
    ค้นหาสินค้าด้วย คำค้นหา
    ตรวจสอบผลการค้นหา
    เลือกดูสินค้า
    ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของ
    เพิ่มจำนวนสินค้าที่ต้องการซื้อ
    เพิ่มสินค้าลงตะกร้า
    ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของสินค้าในตะกร้า
    ใส่ที่อยู่จัดส่งสินค้า
    เลือกวิธีจัดส่งสินค้าเป็น
    ตรวจสอบค่าจัดส่งสินค้าของ Kerry เท่ากันกับ 50.00 บาท
    เลือกช่องทางการชำระเงินแบบ VISA Credit Card
    ตรวจสอบราคารวมที่ต้องชำระเงิน ต้องเท่ากันกับ
    ยืนยัน OTP
    ตรวจสอบหมายเลขพัสดุ
    ยืนยันการส่งการแจ้งเตือนด้วย email และ เบอร์โทรศัพท์

# ทดสอบซื้อสินค้าเลือกวิธีจัดส่งสินค้าเป็น Thai Post และชำระเงินด้วย credit card ของ visa และชำระเงินสำเร็จ
#     ค้นหาสินค้าด้วย คำค้นหา
#     ตรวจสอบผลการค้นหา
#     เลือกดูสินค้า
#     ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของ
#     เพิ่มจำนวนสินค้าที่ต้องการซื้อ
#     เพิ่มสินค้าลงตะกร้า
#     ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของสินค้าในตะกร้า
#     ใส่ที่อยู่จัดส่งสินค้า
#     เลือกวิธีจัดส่งสินค้าเป็น
#     ตรวจสอบค่าจัดส่งสินค้าของ Thai Post เท่ากันกับ 50.00 บาท
#     เลือกช่องทางการชำระเงินแบบ VISA Credit Card
#     ตรวจสอบราคารวมที่ต้องชำระเงิน ต้องเท่ากันกับ
#     ยืนยัน OTP
#     ตรวจสอบหมายเลขพัสดุ
#     ยืนยันการส่งการแจ้งเตือนด้วย email และ เบอร์โทรศัพท์

# ทดสอบซื้อสินค้าเลือกวิธีจัดส่งสินค้าเป็น Thai Post และชำระเงินด้วย credit card ของ master card และชำระเงินสำเร็จ
    # ค้นหาสินค้าด้วย คำค้นหา
    # ตรวจสอบผลการค้นหา
    # เลือกดูสินค้า
    # ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของ
    # เพิ่มจำนวนสินค้าที่ต้องการซื้อ
    # เพิ่มสินค้าลงตะกร้า
    # ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของสินค้าในตะกร้า
    # ใส่ที่อยู่จัดส่งสินค้า
    # เลือกวิธีจัดส่งสินค้าเป็น
    # ตรวจสอบค่าจัดส่งสินค้าของ Thai Post เท่ากันกับ 50.00 บาท
    # เลือกช่องทางการชำระเงินแบบ Master Credit Card
    # ตรวจสอบราคารวมที่ต้องชำระเงิน ต้องเท่ากันกับ
    # ยืนยัน OTP
    # ตรวจสอบหมายเลขพัสดุ
    # ยืนยันการส่งการแจ้งเตือนด้วย email และ เบอร์โทรศัพท์


*** Keywords ***
ค้นหาสินค้าด้วย คำค้นหา
    Open Browser    url=${UAT_URL}    browser=chrome
    Input Text    id:search-product-input    Bicycle
    Click Element    id:search-product-btn    

ตรวจสอบผลการค้นหา
    Wait Until Element Is Visible    id:product-card-1
    Element Should Contain    id:product-card-name-1    Balance Training Bicycle
    Element Should Contain    id:product-card-price-1    ฿4,314.60

เลือกดูสินค้า
    Click Element    id:product-card-1
    
ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของ
    Wait Until Element Is Visible    id:product-detail-point
    Element Should Contain    id:product-detail-point    43 Points

เพิ่มจำนวนสินค้าที่ต้องการซื้อ
    Click Element    id:product-detail-quantity-increment-btn
    Element Attribute Value Should Be    id:product-detail-quantity-input    attribute=value    expected=2

เพิ่มสินค้าลงตะกร้า
    Click Button    locator=product-detail-add-to-cart-btn
    Element Should Contain    id:header-menu-cart-badge    1

ตรวจสอบจำนวนแต้มต่อชิ้นที่จะได้รับของสินค้าในตะกร้า
    Click Element    id:header-menu-cart-badge
    Wait Until Element Is Visible    id:product-1-point
    # Element Should Contain    id:product-1-point    604 Points

ใส่ที่อยู่จัดส่งสินค้า
    Click Element    id:shopping-cart-checkout-btn
    Wait Until Element Is Visible    id:product-1-name
    Input Text    id:shipping-form-first-name-input    พงศกร        
    Input Text    id:shipping-form-last-name-input    รุ่งเรืองทรัพย์
    Input Text    id:shipping-form-address-input    189/413 หมู่ 2
    Select From List By Label    id:shipping-form-province-select    สมุทรปราการ
    Select From List By Label    id:shipping-form-district-select    เมืองสมุทรปราการ
    Select From List By Label    id:shipping-form-sub-district-select    แพรกษาใหม่
    Element Attribute Value Should Be    id:shipping-form-zipcode-input    value     10280
    Input Text    id:shipping-form-mobile-input    0909127991

เลือกวิธีจัดส่งสินค้าเป็น

ตรวจสอบค่าจัดส่งสินค้าของ Kerry เท่ากันกับ 50.00 บาท

เลือกช่องทางการชำระเงินแบบ VISA Credit Card

ตรวจสอบราคารวมที่ต้องชำระเงิน ต้องเท่ากันกับ