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

apt_install() {
    if hash $1 2>/dev/null; then
        echo_red "$1 is already installed"
    else
        echo_green "Installing $1"
        sudo apt-get install -y $1
    fi
}

sudo apt update -y

input="./dependencies.txt"
while IFS= read -r line
do
    apt_install $line
done < "$input"

echo_green "Installing oh-my-zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo_green "Setting up zsh"
chsh -s $(which zsh)
#cp ./zsh/.zshrc $HOME/.zshrc
#rm -rf $HOME/.zshrc