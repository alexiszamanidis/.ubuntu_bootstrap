#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

update_and_upgrade

apt_install snapd
snap_install "code --classic"

# install all vscode extensions
input="../txt_files/vscode_extensions.txt"
while IFS= read -r line
do
    colorful_echo "code --install-extension $line" "GREEN"
    code --install-extension $line --force
done < "$input"

exit 0
