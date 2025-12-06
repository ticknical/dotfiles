#!/bin/sh

. ${HOME}/.dotfiles/etc/init/constants.sh

# change private key permission
find "${GOOGLE_DRIVE_DIR}/my/.dotfiles/.ssh/keys" -type f -name '*.pem' -exec chmod 0600 {} +

# Create symlink to home directory
find "${GOOGLE_DRIVE_DIR}/my/.dotfiles" -mindepth 1 -maxdepth 1 -name '.*' ! -name '.DS_Store' -exec ln -sfnv {} "${HOME}" \;
