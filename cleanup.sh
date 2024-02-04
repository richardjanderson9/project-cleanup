#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 
    exit 1
fi

# Update package lists
apt-get update -y

# Perform system upgrade
apt-get dist-upgrade -y

# Clean up obsolete packages
apt autoremove -y

# Check if there are any important updates
if [ -s /var/run/reboot-required ]; then
    echo "Reboot is required due to important updates."
    reboot
else
    echo "System update completed successfully. No reboot required."
fi