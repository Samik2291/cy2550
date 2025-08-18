#!/bin/bash
# Linux Basics & System Exploration

# System reconnaissance
whoami && id
uname -a
ls -la /etc/passwd

# Find SUID files for privilege escalation
find / -perm -4000 -type f 2>/dev/null

# Check for world-writable files
find / -perm -002 -type f 2>/dev/null | head -5

# Search for interesting files
find / -name "*password*" -o -name "*config*" 2>/dev/null | head -10

# Check running processes and services
ps aux | grep -v "$$"
netstat -tulpn | grep LISTEN

# Look for cron jobs
crontab -l 2>/dev/null
ls -la /etc/cron* 2>/dev/null

echo "Basic system enumeration complete"
