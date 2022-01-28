## Ubuntu Bootstrap

This repository contains a script that sets up a new Ubuntu System, as it installs many useful packages, applications and synchronizes the dotfiles that I am currently using.

-   Bootstrap your new Ubuntu System
-   Never reconfigure your System ever again

**The script is generic so that everyone can download and configure their system** as soon as possible. It will ask you to give your GIT Full name, Git email and UNIX username.

### Usage

#### Docker

Before doing anything, you need to make sure that your machine can run the installation scripts.
We can achieve this with Docker.

```
sudo apt install -y git-all && \
git clone https://github.com/alexiszamanidis/.ubuntu_bootstrap.git ~/.ubuntu_bootstrap && \
bash ~/.ubuntu_bootstrap/scripts/docker.sh
```

#### Installation

After successfully executing the script in Docker Container, you can copy the following command and
bootstrap your system.

```
bash ~/.ubuntu_bootstrap/scripts/install.sh
```

If you are sure that the installation scripts can run to your machine execute the following commands.

```
sudo apt install -y git-all && \
git clone https://github.com/alexiszamanidis/.ubuntu_bootstrap.git ~/.ubuntu_bootstrap && \
bash ~/.ubuntu_bootstrap/scripts/install.sh
```

After running the installation commands open a new terminal.

### New Default Path

You can change the default prompt path by running the command below. The `cd YOUR_NEW_DEFAULT_PATH` will be appended to the .zshrc file, so you can modify it at any time.

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

-   Open `windows_terminal/settings.json`
-   Add any field you want and check what suits you best
    -   I have included the [Aura-Theme](https://github.com/daltonmenezes/aura-theme)

### Txt Files

| Name                  | Format       |
| --------------------- | ------------ |
| apllications.txt      | name --flags |
| packages.txt          | name --flags |
| vscode_extensions.txt | name         |
| chrome_extensions.txt | name id      |

### Scripts

[Read more](https://github.com/alexiszamanidis/.ubuntu_bootstrap/blob/master/SCRIPTS.md)

# Deprecated Repository

This repository is deprecated. Please check out the links below:

-   [ansible](https://github.com/alexiszamanidis/ansible)
-   [dotfiles](https://github.com/alexiszamanidis/dotfiles)
