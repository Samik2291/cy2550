#!/bin/bash
# Comprehensive Cybersecurity Commands Reference

echo "=== Password Cracking Commands ==="

# Download shadow files
curl -o shadow.txt "https://shelat.khoury.northeastern.edu/dl/24f-2550/shadow/$USER.shadow"

# John the Ripper commands
john --wordlist=/usr/share/wordlists/rockyou.txt shadow.txt
john --wordlist=wordlist.txt --rules --fork=3 shadow.txt
john --incremental shadow.txt
john --show shadow.txt
john --status

# Hashcat commands
hashcat -m 1800 -a 0 hashes.txt rockyou.txt
hashcat -m 1800 -a 3 -1 ?u?l hashes.txt ?1?1?1
hashcat -m 500 -a 0 hashes.txt wordlist.txt
hashcat -b
hashcat --show hashes.txt

# Custom wordlist generation
cewl -w custom.txt -d 2 http://example.com
crunch 4 6 abcdefghijklmnopqrstuvwxyz > wordlist.txt

echo "=== Web Security Commands ==="

# Directory enumeration
gobuster dir -u http://target.com -w /usr/share/wordlists/dirb/common.txt
dirb http://target.com
nikto -h http://target.com

# SQL injection testing
sqlmap -u "http://target.com/page?id=1" --dbs
sqlmap -u "http://target.com/page?id=1" --tables
sqlmap -u "http://target.com/page?id=1" --dump

echo "=== Network Security Commands ==="

# Network scanning
nmap -sS -O target.com
nmap -sC -sV -oN scan.txt target.com
masscan -p1-1000 target.com

# Packet analysis
tcpdump -i eth0 -w capture.pcap
wireshark capture.pcap

echo "All commands loaded"
