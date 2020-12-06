## Ubuntu Bootstrap

This repository contains a script that sets up a new Ubuntu System, as it installs many useful dependencies and synchronizes the dotfiles that I am currently using.

-   Bootstrap your new Ubuntu System
-   Never reconfigure your System ever again

**Tested on a new unmodified Windows Subsystem - Ubuntu 20.04 LTS**

### Usage

```
git clone https://github.com/alexiszamanidis/.ubuntu_bootstrap.git ~/.ubuntu_bootstrap
cd ~/.ubuntu_bootstrap
bash install.sh
```

After running the installation commands open a new terminal.

### Windows Terminal

If you are using `Windows Subsystem for Linux` you can download **Windows Terminal** from **Microsoft Store**.

Set your Ubuntu System as default:

-   Open Windows Terminal Settings
-   Copy `guid` from your Ubuntu profile
-   Paste the `guid` you just copied to `defaultProfile` field

Fix Font problems:

-   Open Windows Terminal Settings
-   Add `"fontFace": "FuraMono Nerd Font"` to your Ubuntu profile
