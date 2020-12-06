#!/bin/bash

colorfull_echo() {
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
        colorfull_echo "$1 is already installed" "RED"
    else
        colorfull_echo "Installing $1" "GREEN"
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
    colorfull_echo "Installing oh-my-zsh" "GREEN"
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    colorfull_echo "Installing zsh-autosuggestions" "GREEN"
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    colorfull_echo "Installing zsh-syntax-highlighting" "GREEN"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    colorfull_echo "Installing zsh-z" "GREEN"
    git clone https://github.com/agkozak/zsh-z ~/.oh-my-zsh/custom/plugins/zsh-z
else
    colorfull_echo "oh-my-zsh is already installed" "RED"
fi

colorfull_echo "Setting up our System" "GREEN"
# link all dotfiles
cd .dotfiles
# remove default .zshrc file
rm ~/.zshrc
# unlink all files
stow -vDt ~ bash git zsh aliases
# link all files
stow -vSt ~ bash git zsh aliases
# make ZSH as default shell
chsh -s $(which zsh)
