#!/bin/bash

cd ~/.ubuntu_bootstrap

bash install_packages.sh

# if the running system is not WSL run the applications
# and the chrome extensions installation scripts
if [[ ! -n "$IS_WSL" && ! -n "$WSL_DISTRO_NAME" ]]; then
    bash install_applications.sh
    sudo bash install_chrome_extensions.sh
fi

bash update_and_clean_up.sh

cd $OLDPWD
