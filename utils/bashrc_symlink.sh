#!/bin/bash
#
# bashrc_symlink.sh
# Make $HOME/bashrc a symbolic link to $HOME/.bashrc.
# 1. Remove any existing $HOME/bashrc (file / dir / link).
# 2. Create the new symlink.
# 3. Print verbose debug information.
#

set -euo pipefail

# Resolve home directory robustly
HOME_DIR="${HOME:?Could not detect \$HOME}"

SRC="${HOME_DIR}/.bashrc"
DEST="${HOME_DIR}/bashrc"

echo "[bashrc_symlink] HOME directory: ${HOME_DIR}"
echo "[bashrc_symlink] Source .bashrc: ${SRC}"
echo "[bashrc_symlink] Destination link: ${DEST}"
echo

# Ensure the source exists (warn but continue)
if [[ ! -e "${SRC}" ]]; then
    echo "[bashrc_symlink][WARN] Source file does not exist – the link will still be created."
fi

# Remove existing destination (file, dir or symlink)
if [[ -e "${DEST}" || -L "${DEST}" ]]; then
    echo "[bashrc_symlink] Removing existing ${DEST}"
    rm -rf -- "${DEST}"
fi

# Create the symlink
echo "[bashrc_symlink] Creating symlink ${DEST} -> ${SRC}"
ln -s -- "${SRC}" "${DEST}"

echo "[bashrc_symlink] Result:"
ls -l -- "${DEST}"
echo "[bashrc_symlink] Done."
