#!/bin/sh

. ${HOME}/.dotfiles/etc/init/constants.sh

# change private key permission
chmod 0600 "${GOOGLE_DRIVE_DIR}/.dotfiles/.ssh/keys/*.pem"

# Create symlink to home directory
ln -sfnv "${GOOGLE_DRIVE_DIR}/.dotfiles/.ssh" ${HOME}/.ssh
