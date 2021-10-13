#!/bin/bash

# load helpers.sh
source ./helpers.sh

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

colorful_echo "Installing Chrome Extensions..." "GREEN"

# name - id
install_chrome_extension "AdBlock" "gighmmpiobklfepjocnamgkkbiglidom"
install_chrome_extension "Cookie Editor" "iphcomljdfghbkdcfndaijbokpgddeno"
install_chrome_extension "daily.dev" "jlmpjdjjbgclbocgajdjefcidcncaied"
install_chrome_extension "EditThisCookie" "fngmhnnpilhplaeedifhccceomclgfbg"
install_chrome_extension "Eye Dropper" "hmdcmlfkchdmnmnmheododdhjedfccka"
install_chrome_extension "ModHeader" "idgpnmonknjnojddfkpgkljpfnnfcklj"
install_chrome_extension "React Developer Tools" "fmkadmapgofadopljbjfkapdkoienihi"
install_chrome_extension "Video Speed Controller" "nffaoalbilbmmfgbnbgppjihopabppdk"
install_chrome_extension "Wappalyzer" "gppongmhjkpfnbhagpmjfkannfbllamg"
install_chrome_extension "JSON Viewer" "gbmdgpbipfallnflgajpaliibnhdgobh"
install_chrome_extension "Grammarly" "kbfnbcaeplbcioakkpcpgfkobkghlhen"
