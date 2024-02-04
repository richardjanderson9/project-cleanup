#!/bin/bash

# Log file name
LOG_FILE="script-$(basename "$0" .sh)-output.txt"

# Log start time and date
echo "Script started at $(date)" >> "$LOG_FILE"

# Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" >> "$LOG_FILE"
    exit 1
fi

# Update package lists
apt-get update -y >> "$LOG_FILE" 2>&1

# Perform system upgrade
apt-get dist-upgrade -y >> "$LOG_FILE" 2>&1

# Clean up obsolete packages
apt autoremove -y >> "$LOG_FILE" 2>&1

# Log end time and date
echo "Script completed at $(date)" >> "$LOG_FILE"

# Check if there are any important updates
if [ -s /var/run/reboot-required ]; then
    echo "Reboot is required due to important updates." >> "$LOG_FILE"
    reboot
else
    echo "System update completed successfully. No reboot required." >> "$LOG_FILE"
fi
