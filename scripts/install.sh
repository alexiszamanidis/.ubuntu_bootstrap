#!/bin/bash

cd ~/.ubuntu_bootstrap/scripts

bash install_packages.sh

bash dotfiles.sh "$@"

bash config.sh

# if the running system is WSL exit
if [[ ! -e "$IS_WSL" && ! -e "$WSL_DISTRO_NAME" ]]; then
    cd $OLDPWD
    exit 0
fi

bash install_applications.sh

bash install_vscode.sh

sudo bash install_chrome.sh

bash update_and_clean_up.sh

cd $OLDPWD

exit 0
