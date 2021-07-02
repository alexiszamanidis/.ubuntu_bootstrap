# load functions.sh
source ./functions.sh

# updates the package lists for upgrades for packages that need upgrading
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# install all the applications
input="./txt_files/applications.txt"
while IFS= read -r line
do
    apt_install $line
done < "$input"

# install vscode
sudo snap install --classic code

# install all the vscode extensions
input="./txt_files/applications.txt"
while IFS= read -r line
do
    colorful_echo "code --install-extension $line"
    code --install-extension $line
done < "$input"
