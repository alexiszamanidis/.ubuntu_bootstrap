## Ubuntu Bootstrap

This repository contains a script that sets up a new Ubuntu System, as it installs many useful dependencies and synchronizes the dotfiles that I am currently using.

-   Bootstrap your new Ubuntu System
-   Never reconfigure your System ever again

**Tested on a new unmodified Windows Subsystem - Ubuntu 20.04 LTS**

### Usage

First of all, clone the repository

```
git clone https://github.com/alexiszamanidis/.ubuntu_bootstrap.git ~/.ubuntu_bootstrap
```

After cloning the repository, we have to make some changes before the installation, so make sure to replace:

-   inside `~/.ubuntu_bootstrap/.dotfiles/git/.gitconfig` file the name and email with your own
-   inside `~/.ubuntu_bootstrap/.dotfiles/zsh/.zshrc` file the **alexzam** from export ZSH="/home/**alexzam**/.oh-my-zsh", which is my UNIX username with yours

Ιn the end just run the installation commands

```
cd ~/.ubuntu_bootstrap
bash install.sh
```

After running the installation commands open a new terminal!

### Windows Terminal

If you are using `Windows Subsystem for Linux` you can download **Windows Terminal** from **Microsoft Store**.

Set your Ubuntu System as default:

-   Open Windows Terminal Settings
-   Copy `guid` from your Ubuntu profile
-   Paste the `guid` you just copied to `defaultProfile` field

Fix Font problems:

-   Open Windows Terminal Settings
-   Add `"fontFace": "FuraMono Nerd Font"` to your Ubuntu profile
