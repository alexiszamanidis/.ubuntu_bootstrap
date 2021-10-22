#!/bin/bash

colorful_echo() {
    GREEN="\033[0;32m"
    RED="\033[0;31m"
    NC="\033[0m" # No Color

    if [ "$#" -eq 1 ]; then
        echo -e $1
    elif [ "$2" = "GREEN" ]; then
        echo -e "${GREEN}$1${NC}"
    elif [ "$2" = "RED" ]; then
        echo -e "${RED}$1${NC}"
    fi
}

apt_install() {
    if hash $1 2>/dev/null; then
        colorful_echo "$1 is already installed" "RED"
    else
        colorful_echo "Installing $1" "GREEN"
        sudo apt-get install -y $1
    fi
}

snap_install() {
    if hash $1 2>/dev/null; then
        colorful_echo "$1 is already installed" "RED"
    else
        colorful_echo "Installing $1" "GREEN"
        sudo snap install $1
    fi
}

update_and_upgrade() {
    colorful_echo "Updating and Upgrading" "GREEN"
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get dist-upgrade -y
}
