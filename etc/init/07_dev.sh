#!/bin/sh

. ${HOME}/.dotfiles/etc/init/constants.sh

# get file name latest develop workspace archive
latest=`ls -1t "${GOOGLE_DRIVE_DIR}/.dotfiles/dev/*.tar.bz2" | head -1`

# make develop workspace
mkdir ${HOME}/dev

# restore develop workspace
(cd ${HOME}/dev; tar xjf ${latest};)
