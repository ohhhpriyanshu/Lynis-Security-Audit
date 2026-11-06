#!/bin/sh

# Test ID: CUST-0020
# Description: Check if SSH service / daemon is running

RegisterTest "CUST-0020" "Check SSH daemon status"

if [ "$SKIP_TEST" -eq 0 ]; then
    LogText "Test CUST-0020: Checking SSH Daemon Status"
    
    SSH_STATUS=$(launchctl list 2>/dev/null | grep -i "com.openssh.sshd")
    
    if [ -n "$SSH_STATUS" ]; then
        Display --indent 2 --text "Checking SSH service status" --result "RUNNING" --color YELLOW
        LogText "Result: SSH service is active on host"
    else
        Display --indent 2 --text "Checking SSH service status" --result "NOT FOUND" --color GREEN
        LogText "Result: SSH daemon is not running"
    fi
fi
