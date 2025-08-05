# SauceDemo Automation Testing Project

โปรเจกต์นี้เป็นการทดสอบเว็บไซต์ SauceDemo ด้วย Robot Framework

## โครงสร้าง Project

```
saucedemo-automation/
├── config/                 # Configuration files
├── resources/              # Resource files
│   ├── keywords/          # High-level keywords
│   └── pages/             # Page objects
├── tests/                 # Test cases
├── reports/               # Test reports
├── logs/                  # Log files
└── utils/                 # Utility functions
```

## การติดตั้ง

1. ติดตั้ง Python 3.8+
2. ติดตั้ง dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## การรัน Tests

```bash
# รัน test ทั้งหมด
robot tests/
robot --nostatusrc -L TRACE:DEBUG -d reports -v headless:True -i all tests

# รัน test เฉพาะ suite
robot tests/ui/login_tests.robot
robot tests/ui/checkout_tests.robot
robot tests/ui/product_tests.robot

# รัน test ตาม tag
robot --include smoke tests/

# รัน test ตามชื่อเทสเคส
robot --test TC001_Login_With_Valid_Standard_User tests\login_tests.robot

# รันแบบ parallel
pabot --processes 3 -L TRACE:DEBUG -d reports -v headless:True -i all tests
```

## Test Cases

- **Login Tests**: ทดสอบการเข้าสู่ระบบ
- **Product Tests**: ทดสอบการเพิ่มสินค้าลงตะกร้า
- **Checkout Tests**: ทดสอบกระบวนการซื้อสินค้า

## Tags

- `smoke`: Test cases สำคัญที่ควรรันเป็นประจำ
- `positive`: Test cases ที่ทดสอบ happy path
- `negative`: Test cases ที่ทดสอบ error handling
- `e2e`: End-to-end test cases
