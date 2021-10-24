### Scripts

**Folder**: `scripts`

Before you run any script individual except the `install.sh` you need to move(**cd ~/.ubuntu_bootstrap/scripts**) to `scripts` folder

`install.sh`

This script will execute all the other scripts that will configure your system

`install_packages.sh`

Installs useful packages and all packages needed for the scripts to run

`install_applications.sh`

Installs all applications

`dotfiles.sh`

Synchronizes all dotfiles

| Flag | Description                                                                                                            |
| ---- | ---------------------------------------------------------------------------------------------------------------------- |
| \-d  | Use default values **Full name**: Alexis Zamanidis, **Email**: alexiszamanidis@outlook.com, **Unix Username**: alexzam |

`install_chrome.sh`

Installs google chrome and its extensions

`install_kitty.sh`

Installs kitty and configures it

`install_vscode.sh`

Installs vs code and its extensions

`helpers.sh`

Includes all utility functions

`create_ssh_key.sh`

Creates a new ssh key

`fix_zsh_history_corruption.sh`

Fixes zsh history corruption

`docker.sh`

Docker script to check if the installation scripts can be run on a specific version of Ubuntu

| Name  | Flag | Default          |
| ----- | ---- | ---------------- |
| PORT  | \-p  | 3000             |
| IMAGE | \-i  | ubuntu-bootstrap |
| TAG   | \-t  | 1                |

```
<!-- Default -->
./docker.sh

<!-- Custom Example -->
./docker.sh -p 3001 -i alexis-zamanidis -t 2
```

`update_and_clean_up.sh`

Updates and cleans up the system

Alias:

```
update_and_clean_up
```

| Name   | Flag | Default | Description                                        |
| ------ | ---- | ------- | -------------------------------------------------- |
| VSCODE | \-v  | false   | This option is used for updating vscode extensions |
