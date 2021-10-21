#!/bin/bash

cd ~/.ubuntu_bootstrap/scripts

bash install_packages.sh "$@"

# if the running system is not WSL run the applications
# and the chrome installation scripts
if [[ ! -n "$IS_WSL" && ! -n "$WSL_DISTRO_NAME" ]]; then
    bash install_applications.sh
    # sudo bash install_chrome.sh
fi

bash update_and_clean_up.sh

cd $OLDPWD
