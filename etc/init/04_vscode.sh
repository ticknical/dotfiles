#!/bin/sh

# create symlink to vscode preference directory
ln -sfnv ${HOME}/.vscode/keybindings.json "${HOME}/Library/Application Support/Code/User"
ln -sfnv ${HOME}/.vscode/settings.json "${HOME}/Library/Application Support/Code/User"

# extensions are installed via the vscode entries in .Brewfile (00_brew.sh)
