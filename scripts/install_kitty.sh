#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

update_and_upgrade

apt_install kitty

cp -R ../kitty ~/.config/

exit 0
