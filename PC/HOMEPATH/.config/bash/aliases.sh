#!/usr/bin/env bash

alias ebash='exec bash'

alias aliases='alias | column --table --separator ='

# built-in tools
#: cd into parent directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias back='cd -'
alias rm='rm -i'

#: ls
alias l=ls
alias la='ls -a'
alias lal='ls -al'
alias ll='ls -l'
alias lla='ls -la'

alias cls='clear'
alias path='tr '\'':'\'' '\''\n'\'' <<< "$PATH"'

# external tools

alias b=bat
alias ghv='gh pr view --web || gh repo view --web'
alias ku=kubectl
alias lk=lazygit # easier than typing 'lg'
alias v=nvim
alias vim=nvim
alias zq='zoxide query'

#: cargo
alias jj=cargo
alias jjb='cargo build'
alias jjc='cargo check'
alias jjr='cargo run'

#: dotnet
alias dn=dotnet
alias dnb='dotnet build'
alias dnc='dotnet clean'
alias dnr='dotnet run'
alias dns='dotnet user-secrets'
alias dnt='dotnet test'
alias dnu='dotnet user-secrets'
alias dnus='dotnet user-secrets'

#: eza
alias ls='eza --git --icons --group-directories-first -F' # replace ls with eza
alias llat='eza -al -t modified --sort newest'
alias llt='eza -l -t modified --sort newest'
alias tree='eza --tree'

#: git
alias git=git-util  # symlink in ~/bin directory
alias k=git         # k is easier to type
alias ka='git a'
alias kaa='git aa'
alias kaac='git aac'
alias kac='git ac'
alias kau='git au'
alias kauc='git auc'
alias kb='git b'
alias kbr='git br'
alias kc='git c'
alias kco='git co'
alias kd='git diff'
alias kds='git ds'
alias kf='git f'
alias kl='git l'
alias kcob='git cob'
alias kp='git p'
alias kps='git ps'
alias kpra='git pra'
alias kr='git rebase'
alias kra='git ra'
alias krc='git rc'
alias kri='git ri'
alias krest='git restore'
alias ks='git s'
alias ksl='git sl'
alias ksvv='git svv'
alias kui='git-ui'
alias kw='git w'
alias kwa='git wa'
alias kwc='git wc'
alias kwl='git wl'
alias kwm='git wm'
alias kwr='git wr'

#: golang
alias gb='go build'
alias gr='go run'

#: mdcat
alias md=mdcat
alias mdp='mdcat --paginate'
alias readme='mdcat README.md'

#: python
alias pip='py -m pip'
alias pym='py -m'

# ripgrep
alias rgf='rg --fixed-strings'

#: vs code
alias c=code
alias c.='code .' # open current directory in vscode
alias cbash='code ~/.config/bash'
alias cconf='code ~/.config'
alias cgit='code ~/.config/git'
