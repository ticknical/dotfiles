#!/bin/sh

# get file name latest thunderbird profile
latest=`ls -1t ${HOME}/Dropbox/.dotfiles/thunderbird/*.tar.bz2 | head -1`

# make thunderbird profile
mkdir ${HOME}/Library/Thunderbird

# restore thunderbird profile
(cd ${HOME}/Library/Thunderbird; tar xjf ${latest};)
