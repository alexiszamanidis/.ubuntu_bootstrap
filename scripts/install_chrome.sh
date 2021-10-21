#!/bin/bash

# load helpers.sh
source ~/.ubuntu_bootstrap/scripts/helpers.sh

install_chrome_extension () {
  name=$1
  id=$2
  preferences_dir_path="/opt/google/chrome/extensions"
  upd_url="https://clients2.google.com/service/update2/crx"

  mkdir -p "$preferences_dir_path"
  pref_file_path="$preferences_dir_path/${id}.json"

  echo "{" > "$pref_file_path"
  echo "  \"external_update_url\": \"$upd_url\"" >> "$pref_file_path"
  echo "}" >> "$pref_file_path"

  colorful_echo "${name}" "GREEN"
}

colorful_echo "Installing Chrome" "GREEN"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb

colorful_echo "Installing Chrome Extensions" "GREEN"
input="../txt_files/chrome_extensions.txt"
while IFS=" " read -r name id
do
    install_chrome_extension $name $id
done < "$input"
