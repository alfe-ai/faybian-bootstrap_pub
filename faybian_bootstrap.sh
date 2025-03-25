#!/bin/bash

print_section_header() {
  echo ""
  echo "==============================="
  echo "$1"
  echo "==============================="
}

# TODO: Have the script increase display resolution and enable Gnome Dark Style

# Stage 1: Init
print_section_header "Checking sudo access for $USER"

# Check if the user doesn't already exist in /etc/sudoers
if ! sudo grep -q "$USER ALL=(ALL:ALL) ALL" /etc/sudoers; then
  # Grant the user sudo access
  echo "Adding $USER to /etc/sudoers"
  echo "$USER ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo
else
  echo "$USER already exists in /etc/sudoers"
fi

print_section_header "Overwriting /etc/apt/sources.list"

# Overwrite /etc/apt/sources.list with the file from the repository
sudo wget --header="Cache-Control: no-cache" --header="Pragma: no-cache" -O /etc/apt/sources.list "https://raw.githubusercontent.com/alfe-ai/faybian-bootstrap_pub/refs/heads/main/fileSystem/etc/apt/sources.list?$(date +%s)"

print_section_header "Updating and upgrading packages"

# Upgrade packages with default Yes to the prompt
sudo apt update -y && sudo apt upgrade -y

# Stage 2: ALSH
print_section_header "Creating directory: ~/.alfe.sh and subdirectories."
mkdir /home/$USER/.alfe.sh
mkdir /home/$USER/.alfe.sh/git

print_section_header "Verifying created directories"
if [ -d "/home/$USER/.alfe.sh" ] && [ -d "/home/$USER/.alfe.sh/git" ]; then
  echo "Directories exist."
else 
  echo "Directories do not exist."
fi

print_section_header "Install required packages"
sudo apt install redshift -y
