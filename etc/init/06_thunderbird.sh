#!/bin/sh

# create symlink to thunderbird preference directory
ln -sfnv ${HOME}/Dropbox/.dotfiles/thunderbird/profiles.ini "${HOME}/Library/Thunderbird"
ln -sfnv ${HOME}/Dropbox/.dotfiles/thunderbird/Profiles "${HOME}/Library/Thunderbird"
