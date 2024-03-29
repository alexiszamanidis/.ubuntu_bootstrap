export ZSH="/home//.oh-my-zsh" # //no-commit

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
    sudo
    web-search
    history
    jsontools
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
)

# fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias s="sudo"

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

update_and_clean_up() {
    ~/.ubuntu_bootstrap/scripts/update_and_clean_up.sh "$@"
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
export FZF_DEFAULT_OPTS="--height 100% --layout=reverse --border --preview='bat --style=numbers --color=always --line-range :500 {}'"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

# these commands are used to enable vim remaps
bindkey -r '\C-s'
stty -ixon

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^Q" push-line-or-edit
