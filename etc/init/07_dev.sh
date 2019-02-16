#!/bin/sh

# get file name latest develop workspace archive
latest=`ls -1t ${HOME}/Dropbox/.dotfiles/dev/*.tar.bz2 | head -1`

# make develop workspace
mkdir ${HOME}/dev

# restore develop workspace
(cd ${HOME}/dev; tar xjf ${latest};)
