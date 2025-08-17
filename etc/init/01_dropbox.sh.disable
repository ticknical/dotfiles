#!/bin/sh

# check if you have set up Dropbox
while true; do
    read -p 'Did you Dropbox setup complete until synchronization? [Y/n]' Answer
    case $Answer in
        [Yy]* )
            if [ ! -e ${HOME}/.dropbox/info.json ]; then
                echo 'Dropbox setup has not been completed yet.'
                echo 'Please proceed with Dropbox setup.'
                continue;
            fi
            break;
            ;;
        [Nn]* )
            echo 'Please proceed with Dropbox setup.'
            continue;
            ;;
        * )
            echo Please answer YES or NO.
    esac
done;
