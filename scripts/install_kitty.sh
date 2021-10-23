#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

declare -a packages=("kitty")
install_packages packages

cp -R ../kitty ~/.config/

exit 0
