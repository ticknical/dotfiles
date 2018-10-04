#!/bin/sh

# create symlink to firefox preference directory
ln -sfnv ${HOME}/Dropbox/.dotfiles/firefox/profiles.ini "${HOME}/Library/Application Support/Firefox/profiles.ini"
ln -sfnv ${HOME}/Dropbox/.dotfiles/firefox/Profiles "${HOME}/Library/Application Support/Firefox/Profiles"
