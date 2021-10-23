#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

update_and_upgrade

# install all the applications
input="../txt_files/applications.txt"
while IFS= read -r line
do
    snap_install "$line"
done < "$input"

exit 0
