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

# install all the packages
input="./txt_files/packages.txt"
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

# install fd
colorful_echo "Installing zsh-z" "GREEN"
wget https://github.com/sharkdp/fd/releases/download/v7.3.0/fd-musl_7.3.0_amd64.deb
sudo dpkg -i fd-musl_7.3.0_amd64.deb

# install fzf
if [ ! -d "$HOME/.fzf" ]; then
    colorful_echo "Installing fzf" "GREEN"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
else
    colorful_echo "fzf is already installed" "RED"
fi

colorful_echo "Setting up our System" "GREEN"
cd .dotfiles
# remove default .zshrc file
rm ~/.zshrc
# unlink all files
stow -vDt ~ bash git zsh aliases functions docker vim
# link all files
stow -vSt ~ bash git zsh aliases functions docker vim

# download plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# install vim plugins
vim +'PlugInstall --sync' +qa

# make ZSH as default shell
chsh -s $(which zsh)
