#!/bin/bash

echo_green() {
    GREEN="\033[0;32m"
    NC="\033[0m" # No Color
    echo -e "${GREEN}$1${NC}"
}

echo_red() {
    RED="\033[0;31m"
    NC="\033[0m" # No Color
    echo -e "${RED}$1 $2${NC}"
}

apt_uninstall() {
    if hash $1 2>/dev/null; then
        echo_green "Uninstalling $1"
        sudo apt-get remove -y $1
    else
        echo_red "$1 is not installed"
    fi
}

input="./dependencies.txt"
while IFS= read -r line
do
    apt_uninstall $line
done < "$input"
