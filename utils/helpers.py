# Helper functions for Robot Framework tests

def get_current_timestamp():
    # Get current timestamp for unique identifiers
    from datetime import datetime
    return datetime.now().strftime("%Y%m%d_%H%M%S")

def generate_test_data():
    # Generate test data for tests
    import random
    import string
    
    return {
        'username': ''.join(random.choices(string.ascii_lowercase, k=8)),
        'email': f"test_{get_current_timestamp()}@example.com",
        'phone': ''.join(random.choices(string.digits, k=10))
    }

def format_currency(amount):
    # Format currency for validation
    return f"${amount:.2f}"
