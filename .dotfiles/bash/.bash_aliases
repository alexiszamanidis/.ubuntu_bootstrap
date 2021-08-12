## cd aliases
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## ls aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias l.='ls -d .* --color=auto'

## grep aliases
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## other aliases
alias leak='valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes'
alias c='clear'
alias x=extract
alias zshrc='code ~/.zshrc'
alias topten="history | commands | sort -rn | head"
alias myip="curl http://ipecho.net/plain; echo"
alias dirs='dirs -v | head -10'
alias usage='du -h -d1'
alias update="source ~/.zshrc"
alias sshdir="cd ~/.ssh"
alias runp="lsof -i "
alias md="mkdir "
alias h='history'
alias j='jobs -l'
