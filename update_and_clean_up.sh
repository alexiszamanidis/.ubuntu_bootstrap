#!/bin/bash

# load functions.sh
source ./functions.sh

# update
colorful_echo "Updating and Upgrading..." "GREEN"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# clean up
colorful_echo "Cleaning Cache..." "GREEN"
sudo apt-get clean -y
sudo apt-get autoclean -y

colorful_echo "Removing Unnecessary Packages..." "GREEN"
sudo apt-get autoremove -y

colorful_echo "Cleaning user and root trash..." "GREEN"
sudo trash-empty
trash-empty