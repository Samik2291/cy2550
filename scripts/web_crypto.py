#!/usr/bin/env python3
# Web Exploitation & Cryptography Tools

import requests, hashlib, base64

# Web enumeration
def scan_web(url):
    paths = ['admin', 'login', 'config.php', 'backup', 'robots.txt']
    for path in paths:
        r = requests.get(f"{url}/{path}")
        if r.status_code == 200:
            print(f"Found: {url}/{path}")

# SQL injection test
def test_sqli(url, param):
    payloads = ["' OR '1'='1", "' UNION SELECT 1,2,3--", "admin'--"]
    for payload in payloads:
        data = {param: payload}
        r = requests.post(url, data=data)
        if "mysql" in r.text.lower() or "error" in r.text.lower():
            print(f"Potential SQLi: {payload}")

# Simple crypto functions  
def crack_caesar(text):
    for shift in range(26):
        result = ""
        for char in text:
            if char.isalpha():
                result += chr((ord(char.upper()) - ord('A') - shift) % 26 + ord('A'))
        print(f"Shift {shift}: {result}")

def gen_hashes(text):
    print(f"MD5: {hashlib.md5(text.encode()).hexdigest()}")
    print(f"SHA1: {hashlib.sha1(text.encode()).hexdigest()}")
    print(f"Base64: {base64.b64encode(text.encode()).decode()}")

# Example usage
if __name__ == "__main__":
    print("Cyber toolkit loaded")
    # scan_web("http://example.com")
    # crack_caesar("KHOOR")
    # gen_hashes("password123")
