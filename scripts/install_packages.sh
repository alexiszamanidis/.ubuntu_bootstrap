#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

update_and_upgrade

# install all the packages
input="../txt_files/packages.txt"
while IFS= read -r line
do
    apt_install "$line"
done < "$input"
