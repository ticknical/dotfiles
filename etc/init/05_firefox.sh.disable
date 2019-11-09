#!/bin/sh

# get file name latest firefox profile
latest=`ls -1t ${HOME}/Dropbox/.dotfiles/firefox/*.tar.bz2 | head -1`

# make firefox profile
mkdir ${HOME}/Library/Application\ Support/Firefox

# restore firefox profile
(cd ${HOME}/Library/Application\ Support/Firefox; tar xjf ${latest};)
