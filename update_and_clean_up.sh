#!/bin/bash

# default values
v=false # v: vscode

# iterate throught user input arguments
while getopts :v options; do
  echo ${options}
  case $options in
    v) v=true;;
    ?) 
      echo "Usage [-v]"
      exit 1;;
  esac
done

# load functions.sh
source ~/.ubuntu_bootstrap/functions.sh

# update
colorful_echo "Updating and Upgrading..." "GREEN"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

if [ "$v" = true ] ; then
    colorful_echo "Updating VSCODE extensions..." "GREEN"
    code --list-extensions | 
    while read extension;
    do
        colorful_echo "Updating $extension..." "GREEN"
        code --install-extension $extension --force
    done
fi

# clean up
colorful_echo "Cleaning Cache..." "GREEN"
sudo apt-get clean -y
sudo apt-get autoclean -y

colorful_echo "Removing Unnecessary Packages..." "GREEN"
sudo apt-get autoremove -y

colorful_echo "Cleaning user and root trash..." "GREEN"
trash-empty

exit 0
