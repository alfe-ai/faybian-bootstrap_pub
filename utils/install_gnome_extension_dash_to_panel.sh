#!/bin/bash

# This script installs the Dash to Panel GNOME extension.

#echo "Updating system packages..."
#sudo apt update -y

#echo "Installing GNOME Shell extensions..."
#sudo apt install -y gnome-shell-extensions

echo "Downloading Dash to Panel extension..."
#https://extensions.gnome.org/extension/1160/dash-to-panel/
#https://extensions.gnome.org/download-extension/dash-to-panel%40jderose9.github.com.shell-extension.zip?version_tag=62503
#wget -O /tmp/dash-to-panel.zip "https://extensions.gnome.org/extension-data/dash-to-paneljderose9.github.com.shell-extension.zip"
wget -O /tmp/dash-to-panel.zip "https://extensions.gnome.org/download-extension/dash-to-panel%40jderose9.github.com.shell-extension.zip?version_tag=62503"

echo "Installing Dash to Panel extension..."
gnome-extensions install /tmp/dash-to-panel.zip

echo "Enabling Dash to Panel extension..."
gnome-extensions enable dash-to-panel@jderose9.github.com

echo "Installation complete. You may need to log out or restart GNOME Shell."

