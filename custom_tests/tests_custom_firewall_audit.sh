#!/bin/sh

# Test ID: CUST-0010
# Description: Check if macOS Application Firewall is active

RegisterTest "CUST-0010" "Check macOS Application Firewall status"

if [ "$SKIP_TEST" -eq 0 ]; then
    LogText "Test CUST-0010: Checking macOS Application Firewall"
    
    FIREWALL_STATUS=$(socketfilterfw --getglobalstate 2>/dev/null | grep -i "enabled")
    
    if [ -n "$FIREWALL_STATUS" ]; then
        Display --indent 2 --text "Checking macOS Application Firewall" --result "OK" --color GREEN
        LogText "Result: Firewall is active"
    else
        Display --indent 2 --text "Checking macOS Application Firewall" --result "WARNING" --color RED
        LogText "Result: Firewall is disabled"
        ReportSuggestion $TEST_ID "Enable the macOS Application Firewall in System Settings"
    fi
fi
