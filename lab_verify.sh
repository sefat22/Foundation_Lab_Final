#!/bin/bash 
LOG_FILE="setup_verify.txt" 

# Initialize Log File
echo "--- FELLOWSHIP LAB VERIFICATION REPORT ---" > "$LOG_FILE"
echo "Timestamp: $(date)" >> "$LOG_FILE" 
echo "User: $USER" >> "$LOG_FILE" 
echo "Hostname: $(hostname)" >> "$LOG_FILE" 
echo "------------------------------------------" >> "$LOG_FILE"

echo "[*] Starting System Audit..." 

# [1] Git Check
echo -n "[1] Checking Git... " 
if command -v git &> /dev/null; then 
    GIT_VER=$(git --version) 
    echo "INSTALLED" 
    echo "Git: INSTALLED ($GIT_VER)" >> "$LOG_FILE" 
else 
    echo "MISSING" 
    echo "Git: NOT INSTALLED" >> "$LOG_FILE" 
fi 

# [2] Python3 Check
echo -n "[2] Checking Python3... " 
if command -v python3 &> /dev/null; then 
    PY_VER=$(python3 --version 2>&1) 
    echo "INSTALLED" 
    echo "Python3: INSTALLED ($PY_VER)" >> "$LOG_FILE" 
else 
    echo "MISSING" 
    echo "Python3: NOT INSTALLED" >> "$LOG_FILE" 
fi 

# [3] Network Check (Fixed Syntax)
echo -n "[3] Checking Network... " 
IP_ADDR=$(hostname -I 2>/dev/null | awk '{print $1}')
if [ -n "$IP_ADDR" ]; then 
    echo "READY ($IP_ADDR)" 
    echo "Network IP: $IP_ADDR" >> "$LOG_FILE" 
else
    echo "FAILED (No IP Found)" 
    echo "Network IP: UNKNOWN/OFFLINE" >> "$LOG_FILE" 
fi 

# [4] Virtualization Check
echo -n "[4] Checking Virtual Environment... " 
if command -v systemd-detect-virt &> /dev/null; then 
    VIRT_ENV=$(systemd-detect-virt) 
    if [ "$VIRT_ENV" = "none" ]; then 
        echo "BARE METAL" 
        echo "Virtualization: BARE METAL / HOST" >> "$LOG_FILE" 
    else 
        echo "DETECTED ($VIRT_ENV)" 
        echo "Virtualization: DETECTED ($VIRT_ENV)" >> "$LOG_FILE" 
    fi 
else 
    echo "UNKNOWN/CLOUD" 
    echo "Virtualization: DETECTED (CLOUD/CONTAINER)" >> "$LOG_FILE" 
fi 

# [5] Disk Check
echo -n "[5] Checking Disk Resources... " 
DISK_SPACE=$(df -h / | tail -n 1 | awk '{print $4}') 
if [ -n "$DISK_SPACE" ]; then 
    echo "OK ($DISK_SPACE free)" 
    echo "Available Disk Space: $DISK_SPACE" >> "$LOG_FILE" 
else 
    echo "ERROR" 
    echo "Available Disk Space: ERROR" >> "$LOG_FILE" 
fi 

echo "------------------------------------------" >> "$LOG_FILE" 
echo "AUDIT COMPLETE. STATUS LOGGED." >> "$LOG_FILE" 
echo "------------------------------------------" >> "$LOG_FILE" 
echo "" 
echo "[SUCCESS] Action required: run 'cat setup_verify.txt' to view."