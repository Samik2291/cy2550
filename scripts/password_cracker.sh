#!/bin/bash
# Password Cracking Commands

# Download shadow file from course server
curl -o shadow.txt "https://shelat.khoury.northeastern.edu/dl/24f-2550/shadow/$USER.shadow"

# Install tools
sudo apt install john hashcat -y

# Basic John the Ripper commands
john --wordlist=/usr/share/wordlists/rockyou.txt shadow.txt
john --rules --fork=4 shadow.txt
john --show shadow.txt

# Hashcat examples
hashcat -m 1800 -a 0 hashes.txt /usr/share/wordlists/rockyou.txt
hashcat -m 1800 -a 3 -1 ?u?l hashes.txt ?1?1?1?1

# Generate custom wordlist
cewl -w custom.txt -d 2 http://example.com

# Hash identification
echo "5d41402abc4b2a76b9719d911017c592" | hashcat --identify

echo "Password cracking toolkit ready"
