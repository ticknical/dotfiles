#!/bin/sh

# change private key permission
chmod 0600 ${HOME}/Dropbox/.dotfiles/.ssh/keys/*.pem

# Create symlink to home directory
ln -sfnv ${HOME}/Dropbox/.dotfiles/.ssh ${HOME}/.ssh
