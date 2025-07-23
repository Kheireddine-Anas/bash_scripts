#!/bin/bash

# ===== CONFIG =====
VICTIM_NAME="$(whoami)"
TARGET_IP="192.168.1.$((RANDOM % 256))"
FAKE_CVE="CVE-2023-$((RANDOM % 10000))"
FAKE_PASSWORD="hunter$(shuf -i 1000-9999 -n 1)"

# ===== COLORS =====
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[1;33m'
BLUE=$'\033[0;34m'
PURPLE=$'\033[0;35m'
CYAN=$'\033[0;36m'
NC=$'\033[0m'

# ===== FUNCTIONS =====
typewriter() {
    text=$1
    for ((i=0; i<${#text}; i++)); do
        char="${text:$i:1}"
        if [[ "$char" == $'\033' ]]; then
            # Print the entire escape sequence at once
            echo -n -e "${text:$i:4}"
            # Skip the processed characters
            ((i+=3))
        else
            echo -n "$char"
            sleep 0.03
        fi
    done
    echo
}

progress_bar() {
  echo -ne "${BLUE}["
  for i in {1..25}; do
    echo -ne "#"
    sleep 0.05
  done
  echo -ne "]${NC}"
  echo -e " ${GREEN}COMPLETE!${NC}"
}

glitch_text() {
  echo -ne "${RED}"
  for i in {1..10}; do
    echo -ne "\\$(printf '%03o' "$((RANDOM % 128))")"
    sleep 0.01
  done
  echo -e "${NC}"
}

# ===== MAIN ATTACK SEQUENCE =====
clear
echo -e "${RED}"
echo "  ██╗  ██╗ █████╗  ██████╗██╗  ██╗██████╗ "
echo "  ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔══██╗"
echo "  ███████║███████║██║     █████╔╝ ██████╔╝"
echo "  ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══██╗"
echo "  ██║  ██║██║  ██║╚██████╗██║  ██╗██║  ██║"
echo "  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝"
echo -e "${NC}"

typewriter "${PURPLE}[*] Initializing Advanced Penetration Suite v3.7...${NC}"
sleep 1

# === PHASE 1: Recon ===
typewriter "${YELLOW}[!] Scanning Network for Vulnerable Targets...${NC}"
sleep 1
echo -e "${CYAN}[+] Found Target: ${TARGET_IP} (Windows 11 / Ubuntu 22.04)${NC}"
echo -e "${CYAN}[+] Detected Open Ports: 22(SSH), 80(HTTP), 443(HTTPS), 3389(RDP)${NC}"
echo -e "${CYAN}[+] Vulnerability Identified: ${FAKE_CVE} (Critical RCE)${NC}"
progress_bar

# === PHASE 2: Exploit ===
typewriter "${YELLOW}[!] Exploiting ${FAKE_CVE} for Remote Code Execution...${NC}"
for i in {1..5}; do
  echo -e "${RED}[!] Sending Payload Chunk $i/5...${NC}"
  sleep 0.7
done
glitch_text
echo -e "${GREEN}[+] Exploit Success! Meterpreter Session Established!${NC}"
progress_bar

# === PHASE 3: Privilege Escalation ===
typewriter "${YELLOW}[!] Attempting Privilege Escalation...${NC}"
sleep 1
echo -e "${CYAN}[+] Found Weak Credentials: admin:${FAKE_PASSWORD}${NC}"
echo -e "${GREEN}[+] Root Access Obtained!${NC}"
progress_bar

# === PHASE 4: Data Exfiltration ===
typewriter "${YELLOW}[!] Downloading Sensitive Files...${NC}"
FAKE_FILES=(
  "~/Documents/secret_passwords.txt"
  "~/Pictures/embarrassing_photo.jpg"
  "~/Downloads/illegal_movie_collection.rar"
)
for file in "${FAKE_FILES[@]}"; do
  echo -e "${PURPLE}[+] Exfiltrating: ${file}${NC}"
  progress_bar
done

# === PRANK REVEAL ===
sleep 2
clear
echo -e "${RED}"
echo "▓██   ██▓ ▒█████   █    ██     ██▓     ▒█████    ██████ "
echo " ▒██  ██▒▒██▒  ██▒ ██  ▓██▒   ▓██▒    ▒██▒  ██▒▒██    ▒ "
echo "  ▒██ ██░▒██░  ██▒▓██  ▒██░   ▒██░    ▒██░  ██▒░ ▓██▄   "
echo "  ░ ▐██▓░▒██   ██░▓▓█  ░██░   ▒██░    ▒██   ██░  ▒   ██▒"
echo "  ░ ██▒▓░░ ████▓▒░▒▒█████▓    ░██████▒░ ████▓▒░▒██████▒▒"
echo "   ██▒▒▒ ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒    ░ ▒░▓  ░░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░"
echo " ▓██ ░▒░   ░ ▒ ▒░ ░▒░ ░ ░    ░ ░ ▒  ░  ░ ▒ ▒░ ░ ░▒  ░ ░"
echo " ▒ ▒ ░░  ░ ░ ░ ▒   ░░░ ░ ░      ░ ░   ░ ░ ░ ▒  ░  ░  ░  "
echo " ░ ░         ░ ░     ░            ░  ░    ░ ░        ░  "
echo " ░ ░                                                     "
echo -e "${NC}"

typewriter "${GREEN}[!] JUST KIDDING, ${VICTIM_NAME}! 😆${NC}"
typewriter "${YELLOW}[!] This was an elite-level prank by your friendly neighborhood hacker.${NC}"
typewriter "${CYAN}[!] Your system is safe... or is it? 👀${NC}"
echo -e "\n${PURPLE}Buy me a coffee for this masterpiece! ☕${NC}\n"
