#!/bin/bash

# TODO: Have the script increase display resolution and enable Gnome Dark Style

# Check if the user doesn't already exist in /etc/sudoers
if ! sudo grep -q "$USER ALL=(ALL:ALL) ALL" /etc/sudoers; then
  # Grant the user sudo access
  echo "$USER ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo
fi

# Overwrite /etc/apt/sources.list with the file from the repository
sudo wget -O /etc/apt/sources.list https://raw.githubusercontent.com/alfe-ai/faybian-bootstrap_pub/refs/heads/main/fileSystem/etc/apt/sources.list

# Upgrade packages with default Yes to the prompt
sudo apt update -y && sudo apt upgrade -y
