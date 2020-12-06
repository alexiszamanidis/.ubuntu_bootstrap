export ZSH="/home/alexzam/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    docker
    docker-compose
    extract
    git
    python
    node
    npm
    yarn
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
)

source $ZSH/oh-my-zsh.sh

# stow (th stands for target=home)
stowth() {
    stow -vSt ~ $1
}

unstowth() {
    stow -vDt ~ $1
}

# source global aliases
if [ -f "$HOME/.maven_aliases" ] ; then
    source "$HOME/.maven_aliases"
fi

if [ -f "$HOME/.npm_aliases" ] ; then
    source "$HOME/.npm_aliases"
fi

if [ -f "$HOME/.yarn_aliases" ] ; then
    source "$HOME/.yarn_aliases"
fi

if [ -f "$HOME/.bash_aliases" ] ; then
    source "$HOME/.bash_aliases"
fi

if [ -f "$HOME/.git_aliases" ] ; then
    source "$HOME/.git_aliases"
fi
