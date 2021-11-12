#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

declare -a packages=("kitty" "neovim")

install_packages packages

declare -a i3_packages=("i3" "rofi" "compton" "compton" "i3blocks" "feh")

install_packages i3_packages

mkdir ~/.fonts
cp -R ../fonts/. ~/.fonts/

cp -R ../config/. ~/.config/

exit 0
