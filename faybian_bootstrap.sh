#!/bin/bash

# TODO: Have the script increase display resolution and enable Gnome Dark Style
# TODO: sha/pgp verification for downloaded files.

print_section_header() {
  echo ""
  echo "==============================="
  echo "$1"
  echo "==============================="
}

print_section_header "List of sha256sums"

sha256sum_list=(
  "d29bd8f048dcda31e8c46f051b09e79cde5d064c48400d37cd4515e71d9cf00d  /tmp/dash-to-panel.zip"
  "d29bd8f048dcda31e8c46f051b09e79cde5d064c48400d37cd4515e71d9cf00d  https://extensions.gnome.org/extension-data/dash-to-paneljderose9.github.com.v68.shell-extension.zip"
  "4d14a6e42c22ff3d6bee1df33095bf2944c3df9b96e5b20e4024d3b0a0e4c0ea  config/dash-to-panel-config.txt"
  "38d70e671c6bc1ee8af97fdbd5174dbb42457880835ead7dc933abb60fa00c0e  utils/install_gnome_extension_dash_to_panel.sh"
  "8cc1d2461c3d85ca41483a6f128842369c4e9ebbb3d236d9464941554b22755a  utils/install_openssh_server.sh"
)

for item in "${sha256sum_list[@]}"; do
  echo "$item"
done

print_section_header "Checking sudo access for $USER"

if ! sudo grep -q "$USER ALL=(ALL:ALL) ALL" /etc/sudoers; then
  echo "Adding $USER to /etc/sudoers"
  echo "$USER ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo
else
  echo "$USER already exists in /etc/sudoers"
fi

print_section_header "Overwriting /etc/apt/sources.list"

sudo wget --header="Cache-Control: no-cache" --header="Pragma: no-cache" -O /etc/apt/sources.list "https://raw.githubusercontent.com/alfe-ai/faybian-bootstrap_pub/refs/heads/main/fileSystem/etc/apt/sources.list?$(date +%s)"

print_section_header "Updating and upgrading packages"
sudo apt update -y && sudo apt upgrade -y

print_section_header "Creating directory: ~/.alfe.sh and subdirectories."
mkdir /home/$USER/.alfe.sh
mkdir /home/$USER/.alfe.sh/git
mkdir /home/$USER/.alfe.sh/FaybianScripts
mkdir /home/$USER/.alfe.sh/FaybianScripts/utils

print_section_header "Verifying created directories"
if [ -d "/home/$USER/.alfe.sh" ] && [ -d "/home/$USER/.alfe.sh/git" ] && [ -d "/home/$USER/.alfe.sh/FaybianScripts" ] && [ -d "/home/$USER/.alfe.sh/FaybianScripts/utils" ]; then
  echo "Directories exist."
else 
  echo "Directories do not exist."
fi

print_section_header "Download and install textc.sh"
sudo wget --header="Cache-Control: no-cache" --header="Pragma: no-cache" -O /home/$USER/.alfe.sh/FaybianScripts/utils/textc.sh "https://raw.githubusercontent.com/alfe-ai/faybian-scripts/refs/heads/main/FaybianScripts/textc.sh?$(date +%s)"

print_section_header "Set permissions for ~/.alfe.sh and subdirectories to $USER"
sudo chown -R $USER:$USER /home/$USER/.alfe.sh
sudo chmod -R 700 /home/$USER/.alfe.sh

print_section_header "Install required packages"
sudo apt install redshift fastfetch nodejs npm screen -y

print_section_header "Download and install ALSH"
sudo wget --header="Cache-Control: no-cache" --header="Pragma: no-cache" -O /home/$USER/.bashrc "https://raw.githubusercontent.com/alfe-ai/faybian-scripts/refs/heads/main/filesystemRoot/home/user/bashrc?$(date +%s)"

