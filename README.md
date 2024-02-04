# Debian System Update Script

## Introduction
This script updates a Debian-based Linux machine by updating package lists, performing system upgrades, and cleaning up obsolete packages.

## Starting Steps
Before using the script, ensure that Git is installed on your system. If not, you can install it by following these steps:

1. **Update Package Lists**: 
    - Run the following command to update the package lists:
      ```
      sudo apt-get update
      ```

2. **Install Git**: 
    - Use the following command to install Git:
      ```
      sudo apt-get install git -y
      ```

Once Git is installed, proceed with the usage instructions outlined below.

## Usage
1. **Clone the Repository**: 
    - Clone the repository using Git:
      ```
      git clone https://github.com/richardjanderson9/project-cleanup
      ```

2. **Navigate to the Script Directory**: 
    - Navigate to the directory where the script is located:
      ```
      cd project-cleanup
      ```

3. **Make the Script Executable**: 
    - Run the following command to make the script executable:
      ```
      chmod +x cleanup.sh
      ```

4. **Run the Script**: 
    - Execute with root privileges:
      ```
      sudo ./cleanup.sh
      ```
    - Enter your password if prompted.

5. **Script Execution**: 
    - The script will automatically update package lists, upgrade the system, and clean up obsolete packages.
    - Displays a success message upon completion.

## Notes
- Requires administrative privileges.
- For Debian-based systems only.
- Review output for errors.

## Express
⚠️ **Warning:** Use with caution. This will execute commands automatically.

To quickly execute all the commands at once, copy and paste the following:

Clone the repository using Git:
      ```
      sudo apt-get update && sudo apt-get install git -y && git clone https://github.com/richardjanderson9/project-cleanup && cd project-cleanup && chmod +x cleanup.sh && sudo ./cleanup.sh
      ```

## Made with Love using ChatGPT!