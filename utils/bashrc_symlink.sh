#!/bin/bash

# bashrc_symlink.sh
# Creates a symbolic link $HOME/bashrc -> $HOME/.bashrc.
# If $HOME/bashrc exists as a regular file (or any other type),
# it is removed prior to creating the symlink.

SOURCE_BASHRC="$HOME/.bashrc"
DEST_BASHRC="$HOME/bashrc"

# Ensure the parent directory exists (usually $HOME, but keep generic).
mkdir -p "$(dirname "$DEST_BASHRC")"

# Remove any existing file, link, or directory at the destination.
if [ -e "$DEST_BASHRC" ] || [ -L "$DEST_BASHRC" ]; then
    echo "Removing existing destination: $DEST_BASHRC"
    rm -rf "$DEST_BASHRC"
fi

# Create the symlink.
ln -s "$SOURCE_BASHRC" "$DEST_BASHRC"
echo "Symlink created: $DEST_BASHRC -> $SOURCE_BASHRC"
