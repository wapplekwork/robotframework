# 🧪 Sauce Demo Robot Framework Test Automation

Automated test suite for [Sauce Demo](https://www.saucedemo.com) using Robot Framework

## 📋 Table of Contents
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Running Tests](#running-tests)
- [Test Reports](#test-reports)
- [Configuration](#configuration)

## 🛠 Prerequisites

- **Python 3.8+**
- **Java 8+** (for Allure reports - optional)
- **Chrome Browser**
- **Git**

## 📁 Project Structure

```
sauce-demo-robotframework/
├── tests/
│   ├── ui/
│   │   ├── login_tests.robot          # Login functionality tests
│   │   ├── product_tests.robot        # Product/Cart tests
│   │   └── checkout_tests.robot       # Checkout flow tests
│   ├── api/                          # API tests (future)
│   └── db/                           # Database tests (future)
├── resources/
│   ├── keywords/
│   │   ├── common_keyword.robot       # Common reusable keywords
│   │   ├── login_keywords.robot       # Login specific keywords
│   │   └── selenium_keywords.resource # Browser management
│   ├── pages/
│   │   ├── login_page.robot          # Login page object
│   │   ├── products_page.robot       # Products page object
│   │   ├── cart_page.robot           # Cart page object
│   │   └── checkout_page.robot       # Checkout page object
│   └── page_locators/
│       ├── login_locator.resource    # Login page locators
│       ├── product_locator.resource  # Product page locators
│       ├── cart_locator.resource     # Cart page locators
│       └── checkout_locator.resource # Checkout page locators
├── data/
│   ├── data.yaml                     # Test data
│   └── settings.yaml                 # Configuration settings
├── config/
│   ├── settings.py                   # Python configuration
│   └── test_data.py                  # Python test data
├── reports/                          # Test execution reports
├── requirements.txt                  # Python dependencies
└── run_tests.ps1                     # PowerShell test runner
```

## 🚀 Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/watsanak/sauce-demo-robotframework.git
   cd sauce-demo-robotframework
   ```

2. **Create virtual environment:**
   ```bash
   python -m venv .venv
   .venv\Scripts\activate  # Windows
   ```

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

## 🎯 Running Tests

### Using PowerShell Script (Recommended)

```powershell
# Run all tests
.\run_tests.ps1

# Run specific test suite
.\run_tests.ps1 -TestSuite "login"
.\run_tests.ps1 -TestSuite "product"
.\run_tests.ps1 -TestSuite "checkout"

# Run smoke tests only
.\run_tests.ps1 -TestSuite "smoke"

# Run with specific tags
.\run_tests.ps1 -Tags "positive"
.\run_tests.ps1 -Tags "negative"

# Run in headless mode
.\run_tests.ps1 -Headless

# Run with parallel execution
.\run_tests.ps1 -Parallel
```

### Using Robot Framework Directly

```bash
# Run all tests
robot tests/ui/

# Run specific test file
robot tests/ui/login_tests.robot
robot --test TC001_Login_With_Valid_Standard_User tests\login_tests.robot

# Run with tags
robot --include positive tests/ui/
robot --include smoke tests/ui/
robot --nostatusrc -L TRACE:DEBUG -d reports -v headless:True -i all tests

# Run with variables
robot --variable headless:true tests/ui/
```

### Using Pabot (Parallel Execution)

```bash
pabot --processes 2 tests/ui/
pabot --processes 3 -L TRACE:DEBUG -d reports -v headless:True -i all tests
```

## 📊 Test Reports

After test execution, reports are generated in the `reports/` directory:

- **log.html** - Detailed execution log
- **report.html** - Test execution summary
- **output.xml** - Raw test results (XML)

## 🔧 Configuration

### Test Data (`data/data.yaml`)
```yaml
base_url: "https://www.saucedemo.com"
login_data:
  valid_users:
    standard_user:
      username: "standard_user"
      password: "secret_sauce"
```

### Environment Variables
- `headless` - Run browser in headless mode (true/false)
- `base_url` - Application URL
- `implicit_wait` - Implicit wait timeout
- `explicit_wait` - Explicit wait timeout

## 🏷 Test Tags

- **smoke** - Critical functionality tests
- **positive** - Happy path scenarios
- **negative** - Error/edge case scenarios
- **login** - Login functionality
- **product** - Product/cart functionality
- **checkout** - Checkout flow
- **e2e** - End-to-end scenarios

## 🐛 Troubleshooting

### Common Issues

1. **ChromeDriver Issues:**
   ```bash
   # Update ChromeDriver path in selenium_keywords.resource
   ${CHROME_DRIVER_PATH_WINS} = C:/path/to/chromedriver.exe
   ```

2. **Element Not Found:**
   - Check if locators are up to date
   - Increase wait times if needed
   - Verify element is visible before interaction

3. **Import Errors:**
   - Ensure all resource files are properly imported
   - Check file paths are correct
   - Verify Python environment is activated

## 📈 Test Coverage

Current test coverage includes:

- ✅ User Authentication (Login/Logout)
- ✅ Product Browsing
- ✅ Shopping Cart Management
- ✅ Checkout Process
- ⏳ User Management (Planned)
- ⏳ API Testing (Planned)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## 📞 Support

For questions or issues, please create an issue in the GitHub repository.

---
**Happy Testing!** 🧪✨
