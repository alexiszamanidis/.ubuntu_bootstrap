#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

declare -a packages=("kitty" "neovim")

install_packages packages

cp -R ../config/. ~/.config/

exit 0
