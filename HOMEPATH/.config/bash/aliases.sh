#!/usr/bin/env bash
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias ls='ls --color --block-size=K'
alias la='ls -A'
alias ll='ls -l'
alias lal='ls -Al'
alias lla='ls -Al'
alias llt='ls -lt'
alias llat='ls -Alt'
alias tree='cmd //c tree' # use cmd.exe "tree command"

alias path="tr ':' '\n' <<< \"$PATH\""

alias k='git'
alias ka='git a'
alias kaa='git aa'
alias kaacm='git aacm'
alias kacm='git acm'
alias kau='git au'
alias kaucm='git aucm'
alias kb='git b'
alias kbr='git br'
alias kc='git c'
alias kcm='git cm'
alias kco='git co'
alias kd='git diff'
alias kds='git ds'
alias kf='git f'
alias kl='git l'
alias kcob='git cob'
alias kp='git p'
alias kps='git ps'
alias krest='git restore'
alias kr='git rebase'
alias ks='git s'
alias ksl='git sl'
alias ksvv='git svv'
alias kundo='git undo'
alias kunstage='git unstage'

alias c=code
alias c.='code .' # open current directory in vscode
alias dn=dotnet

alias v=vim
alias vim=nvim
