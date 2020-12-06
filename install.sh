#!/bin/bash

# read user input
read -p "Git Full name: " git_full_name
read -p "Git Email: " git_email
read -p "UNIX Username: " unix_username

# prepare zsh file replacement
zshOld="export ZSH=\"\/home\/\/.oh-my-zsh\""
zshNew="export ZSH=\"\/home\/${unix_username}\/.oh-my-zsh\""

# process .gitconfig and .zshrc files based on user input
sed -i "s/name = /name = ${git_full_name}/g" ~/.ubuntu_bootstrap/.dotfiles/git/.gitconfig
sed -i "s/email = /email = ${git_email}/g" ~/.ubuntu_bootstrap/.dotfiles/git/.gitconfig
sed -i "s/${zshOld}/${zshNew}/g" ~/.ubuntu_bootstrap/.dotfiles/zsh/.zshrc

# load functions.sh
source ./functions.sh

# updates the package lists for upgrades for packages that need upgrading
sudo apt update -y

# install all the dependencies
input="./dependencies.txt"
while IFS= read -r line
do
    apt_install $line
done < "$input"

# install .oh-my-zsh and its plugins
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    colorful_echo "Installing oh-my-zsh" "GREEN"
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
    colorful_echo "Installing zsh-autosuggestions" "GREEN"
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    colorful_echo "Installing zsh-syntax-highlighting" "GREEN"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    colorful_echo "Installing zsh-z" "GREEN"
    git clone https://github.com/agkozak/zsh-z ~/.oh-my-zsh/custom/plugins/zsh-z
else
    colorful_echo "oh-my-zsh is already installed" "RED"
fi

colorful_echo "Setting up our System" "GREEN"
cd .dotfiles
# remove default .zshrc file
rm ~/.zshrc
# unlink all files
stow -vDt ~ bash git zsh aliases
# link all files
stow -vSt ~ bash git zsh aliases
# make ZSH as default shell
chsh -s $(which zsh)