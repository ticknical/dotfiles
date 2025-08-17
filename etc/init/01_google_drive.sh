#!/bin/sh

. ${HOME}/.dotfiles/etc/init/constants.sh

# check if you have set up Google Drive
while true; do
    read -p 'Did you Google Drive setup complete until synchronization? [Y/n]' Answer
    case $Answer in
        [Yy]* )
            if [ ! -e "${GOOGLE_DRIVE_DIR}" ]; then
                echo 'Google Drive setup has not been completed yet.'
                echo 'Please proceed with Google Drive setup.'
                continue;
            fi
            break;
            ;;
        [Nn]* )
            echo 'Please proceed with Google Drive setup.'
            continue;
            ;;
        * )
            echo Please answer YES or NO.
    esac
done;
