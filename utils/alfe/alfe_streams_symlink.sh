#!/bin/bash

# alfe_streams_symlink.sh
# This script creates symbolic links for alfe-PROD and alfe-DEV.

# Define source and destination paths for PROD
SOURCE_PROD="/mnt/part5/dot_fayra/Whimsical/git/alfe/dev-favicon"
DESTINATION_PROD="~/git/alfe-PROD"

# Define source and destination paths for DEV
SOURCE_DEV="/mnt/part5/dot_fayra/Whimsical/git/alfe-bugfix-chrome-profile_SingletonCookie"
DESTINATION_DEV="~/git/alfe-DEV"

# Expand tilde manually, because in scripts ~ is not expanded automatically
DESTINATION_PROD_EXPANDED="$HOME/git/alfe-PROD"
DESTINATION_DEV_EXPANDED="$HOME/git/alfe-DEV"

# Function to create a symlink
create_symlink() {
    local source_path=$1
    local destination_path=$2

    # Create the parent directory if it doesn't exist
    mkdir -p "$(dirname "$destination_path")"

    # Remove existing symlink or file if it exists
    if [ -e "$destination_path" ] || [ -L "$destination_path" ]; then
        echo "Removing existing destination: $destination_path"
        rm -rf "$destination_path"
    fi

    # Create the symlink
    ln -s "$source_path" "$destination_path"
    echo "Symlink created: $destination_path -> $source_path"
}

# Create symlink for PROD
create_symlink "$SOURCE_PROD" "$DESTINATION_PROD_EXPANDED"

# Create symlink for DEV
create_symlink "$SOURCE_DEV" "$DESTINATION_DEV_EXPANDED"
