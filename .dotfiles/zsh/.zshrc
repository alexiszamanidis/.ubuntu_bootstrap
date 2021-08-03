export ZSH="/home//.oh-my-zsh"

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

reload() {
    source ~/.zshrc
}

declare -a dotfiles=(".maven_aliases" ".npm_aliases" ".yarn_aliases" 
                     ".bash_aliases" ".git_aliases" ".docker_aliases" 
                     ".functions")

# source global aliases
for dotfile in "${dotfiles[@]}"
do
    if [ -f "$HOME/$dotfile" ] ; then
        source "$HOME/$dotfile"
    fi
done

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^P' fzf-file-widget
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --preview='bat --style=numbers --color=always --line-range :500 {}'"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
