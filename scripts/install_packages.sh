#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

# updates the package lists for upgrades for packages that need upgrading
sudo apt update -y

# install all the packages
input="../txt_files/packages.txt"
while IFS= read -r line
do
    apt_install "$line"
done < "$input"
