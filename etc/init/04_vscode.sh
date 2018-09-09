#!/bin/sh

# create symlink to vscode preference directory
ln -sfnv ${HOME}/.vscode/keybindings.json "${HOME}/Library/Application Support/Code/User"
ln -sfnv ${HOME}/.vscode/settings.json "${HOME}/Library/Application Support/Code/User"

# install extension via extension-list.txt
cat ${HOME}/.vscode/extension-list.txt | while read line
do
    code --install-extension $line
done
