export ZSH="/home//.oh-my-zsh"
# PATH is env variable which tells where to look for commands,in your case the npm bin was not at the right path
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

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

if [ -f "$HOME/.docker_aliases" ] ; then
    source "$HOME/.docker_aliases"
fi

if [ -f "$HOME/.functions" ] ; then
    source "$HOME/.functions"
fi
