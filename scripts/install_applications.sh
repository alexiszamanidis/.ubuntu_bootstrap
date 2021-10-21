#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

# updates the package lists for upgrades for packages that need upgrading
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# install all the applications
input="../txt_files/applications.txt"
while IFS= read -r line
do
    snap_install "$line"
done < "$input"

# install all the vscode extensions
input="../txt_files/vscode_extensions.txt"
while IFS= read -r line
do
    colorful_echo "code --install-extension $line" "GREEN"
    code --install-extension $line
done < "$input"
