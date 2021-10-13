## Ubuntu Bootstrap

This repository contains a script that sets up a new Ubuntu System, as it installs many useful packages, applications and synchronizes the dotfiles that I am currently using.

-   Bootstrap your new Ubuntu System
-   Never reconfigure your System ever again

**The script is generic so that everyone can download and configure their system** as soon as possible. It will ask you to give your GIT Full name, Git email and UNIX username.

**Tested on a new unmodified Windows Subsystem - Ubuntu 20.04 LTS**

### Usage

```
sudo apt install -y git-all && \
git clone https://github.com/alexiszamanidis/.ubuntu_bootstrap.git ~/.ubuntu_bootstrap && \
bash ~/.ubuntu_bootstrap/install.sh
```

After running the installation commands open a new terminal.

### New Default Path

You can change the default prompt path by running the command below. The ``cd YOUR_NEW_DEFAULT_PATH`` will be appended to the .zshrc file, so you can modify it at any time.

```
echo -e "cd YOUR_NEW_DEFAULT_PATH" >> ~/.zshrc
```

### Clearing script

There is also an update and clearing script.

```
update_and_clean_up
```

| Name    | Flag | Default | Description                                             |
| ------- | ---- | ------- | ------------------------------------------------------- |
| VSCODE  | \-v  | false   | This option is used for updating your vscode extensions |

### Windows Terminal

If you are using `Windows Subsystem for Linux` you can download **Windows Terminal** from **Microsoft Store**.

**Set your Ubuntu System as default**:

-   Open Windows Terminal Settings
-   Copy `guid` from your Ubuntu profile
-   Paste the `guid` you just copied to `defaultProfile` field

**Add custom icon**

-   Go to Windows Terminal folder
-   Add your icon inside RoamingState folder
-   Open Windows Terminal Settings
-   Add "icon": "ms-appdata:///roaming/{YOUR_ICON_NAME}" to your Ubuntu profile

**More custom settings**:

-   Open ``WindowsTerminal/settings.json``
-   Add any field you want and check what suits you best

### Txt Files

| Name                  | Format  |
| --------------------- | ------- |
| apllications.txt      | name    |
| packages.txt          | name    |
| vscode_extensions.txt | name    |
| chrome_extensions.txt | name id |
