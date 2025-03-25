#!/bin/bash

print_section_header() {
  echo "==============================="
  echo "$1"
  echo "==============================="
}

# TODO: Have the script increase display resolution and enable Gnome Dark Style

print_section_header "Checking sudo access for $USER"

# Check if the user doesn't already exist in /etc/sudoers
if ! sudo grep -q "$USER ALL=(ALL:ALL) ALL" /etc/sudoers; then
  # Grant the user sudo access
  print_section_header "Adding $USER to /etc/sudoers"
  echo "$USER ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo
else
  print_section_header "$USER already exists in /etc/sudoers"
fi

print_section_header "Overwriting /etc/apt/sources.list"

# Overwrite /etc/apt/sources.list with the file from the repository
sudo wget --header="Cache-Control: no-cache" -O /etc/apt/sources.list https://raw.githubusercontent.com/alfe-ai/faybian-bootstrap_pub/refs/heads/main/fileSystem/etc/apt/sources.list

print_section_header "Updating and upgrading packages"

# Upgrade packages with default Yes to the prompt
sudo apt update -y && sudo apt upgrade -y

