## Ubuntu Bootstrap

This repository contains a script that sets up a new Ubuntu System, as it installs many useful dependencies and synchronizes my dotfiles that I am currently using.

* Bootstrap your new Ubuntu System
* Never reconfigure your System ever again

### Usage

```
git clone 
cd 
bash install.sh
```

If you want to have the aliases in bash terminal as well, you have to run:
```
cd 
cat source_aliases >> ~/.bashrc
```

### Windows Terminal

If you are using ``Windows Subsystem for Linux`` you can download **Windows Terminal** from **Microsoft Store**.

Set your Ubuntu System as default:

* Open Windows Terminal Settings
* Copy ``guid`` from your Ubuntu profile
* Paste the ``guid`` you just copied to ``defaultProfile`` field

Fix Font problems:

* Open Windows Terminal Settings
* Add ``"fontFace": "FuraMono Nerd Font"`` field to your Ubuntu profile
