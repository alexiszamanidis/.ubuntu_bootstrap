#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

if [ "$#" -ne 1 ]; then
    colorful_echo "Please provide name" "RED"
    colorful_echo "e.g. bash scripts/create_ssh_key '<name>'" "RED"
    exit -1
fi

ssh-keygen -t rsa -C "$1"

colorful_echo "Your public key: \n" "GREEN"

cat ~/.ssh/id_rsa.pub

colorful_echo "\nAdd your public key to:" "GREEN"
colorful_echo "GitHub: https://github.com/settings/ssh/new" "GREEN"
colorful_echo "GitLab: https://gitlab.com/-/profile/keys" "GREEN"
