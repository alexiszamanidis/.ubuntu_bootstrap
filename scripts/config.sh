#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

declare -a packages=("kitty" "neovim"
                                #   i3 packages
                                   "i3" "rofi" "compton" "compton" "i3blocks" "feh")

install_packages packages

# i3
mkdir ~/.fonts
cp -R ../fonts/. ~/.fonts/

cp -R ../config/. ~/.config/

exit 0
