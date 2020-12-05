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

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo_green "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo_green "Installing zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    echo_green "Installing zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
    echo_red "oh-my-zsh is already installed"
fi

echo_green "Setting up our System"
# link all dotfiles
cd .dotfiles
# unlink all files
stow -vDt ~ bash git zsh
# link all files
stow -vSt ~ bash git zsh
# make ZSH as default shell
chsh -s $(which zsh)
