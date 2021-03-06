## Ubuntu Bootstrap

This repository contains a script that sets up a new Ubuntu System, as it installs many useful dependencies and synchronizes the dotfiles that I am currently using.

-   Bootstrap your new Ubuntu System
-   Never reconfigure your System ever again

**The script is generic so that everyone can download and configure their system** as soon as possible. It will ask you to give your GIT Full name, Git email and UNIX username.

**Tested on a new unmodified Windows Subsystem - Ubuntu 20.04 LTS**

### Usage

```
sudo apt install git-all
git clone https://github.com/alexiszamanidis/.ubuntu_bootstrap.git ~/.ubuntu_bootstrap
cd ~/.ubuntu_bootstrap
bash install_dependencies.sh
bash install_applications.sh
```

After running the installation commands open a new terminal.

### New Default Path

You can change the default prompt path by running the command below. The ``cd YOUR_NEW_DEFAULT_PATH`` will be appended to the .zshrc file, so you can modify it at any time.

```
echo -e "cd YOUR_NEW_DEFAULT_PATH" >> ~/.zshrc
```

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
