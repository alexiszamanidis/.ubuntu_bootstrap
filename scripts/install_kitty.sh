#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

apt_install kitty

cp -R ../kitty ~/.config/

exit 0
