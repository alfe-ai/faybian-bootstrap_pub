#!/bin/bash

# alfe_streams_symlink.sh
# This script creates a symbolic link from ~/git/alfe-PROD to /mnt/part5/dot_fayra/Whimsical/git/alfe/dev-favicon

# Define source and destination paths
SOURCE="/mnt/part5/dot_fayra/Whimsical/git/alfe/dev-favicon"
DESTINATION="~/git/alfe-PROD"

# Expand tilde manually, because in scripts ~ is not expanded automatically
DESTINATION_EXPANDED="$HOME/git/alfe-PROD"

# Create the parent directory if it doesn't exist
mkdir -p "$(dirname \"$DESTINATION_EXPANDED\")"

# Remove existing symlink or file if it exists
if [ -e "$DESTINATION_EXPANDED" ] || [ -L "$DESTINATION_EXPANDED" ]; then
    echo "Removing existing destination: $DESTINATION_EXPANDED"
    rm -rf "$DESTINATION_EXPANDED"
fi

# Create the symlink
ln -s "$SOURCE" "$DESTINATION_EXPANDED"
echo "Symlink created: $DESTINATION_EXPANDED -> $SOURCE"
