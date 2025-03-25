#!/bin/bash

# TODO: Have the script increase display resolution and enable Gnome Dark Style

# Grant the user sudo access
echo "$USER ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo

# Overwrite /etc/apt/sources.list with the file from the repository
sudo wget -O /etc/apt/sources.list https://raw.githubusercontent.com/alfe-ai/faybian-bootstrap_pub/refs/heads/main/fileSystem/etc/apt/sources.list

# Upgrade packages
sudo apt update && sudo apt upgrade

