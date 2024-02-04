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

# Function to check for script updates
check_for_updates() {
    LATEST_VERSION=$(curl -s https://api.github.com/repos/richardjanderson9/project-cleanup/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    CURRENT_VERSION=$(git describe --tags)
    if [ "$LATEST_VERSION" != "$CURRENT_VERSION" ]; then
        echo "A new version of the script is available. Current version: $CURRENT_VERSION, Latest version: $LATEST_VERSION" >> "$LOG_FILE"
        echo "Do you want to update the script? (y/n)"
        read -r choice
        if [ "$choice" = "y" ]; then
            echo "Updating script..."
            git pull origin master
            echo "Script updated successfully to version $LATEST_VERSION" >> "$LOG_FILE"
        else
            echo "Skipping script update." >> "$LOG_FILE"
        fi
    else
        echo "Script is up to date." >> "$LOG_FILE"
    fi
}

# Update package lists
apt-get update -y >> "$LOG_FILE" 2>&1

# Perform system upgrade
apt-get dist-upgrade -y >> "$LOG_FILE" 2>&1

# Clean up obsolete packages
apt autoremove -y >> "$LOG_FILE" 2>&1

# Check for script updates
check_for_updates

# Log end time and date
echo "Script completed at $(date)" >> "$LOG_FILE"

# Check if there are any important updates
if [ -s /var/run/reboot-required ]; then
    echo "Reboot is required due to important updates." >> "$LOG_FILE"
    reboot
else
    echo "System update completed successfully. No reboot required." >> "$LOG_FILE"
fi
