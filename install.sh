#!/bin/bash

cd ~/.ubuntu_bootstrap

bash install_packages.sh

# if the running system is not WSL run the applications installation script
if [[ ! -n "$IS_WSL" && ! -n "$WSL_DISTRO_NAME" ]]; then
    bash install_applications.sh
fi

bash update_and_clean_up.sh

echo $OLDPWD
