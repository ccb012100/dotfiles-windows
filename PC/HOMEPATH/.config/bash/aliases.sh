#!/usr/bin/env bash
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias back='cd -'

alias l=less

alias ls='ls --color --block-size=K'
alias la='ls -A'
alias ll='ls -l'
alias lal='ls -Al'
alias lla='ls -Al'
alias llt='ls -lt'
alias llat='ls -Alt'
alias tree='cmd //c tree' # use cmd.exe "tree command"

alias cls='clear'
alias path='tr '\'':'\'' '\''\n'\'' <<< "$PATH"'

# k is easier to type
alias k=git
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
alias kr='git rebase'
alias kra='git ra'
alias krc='git rc'
alias kri='git ri'
alias krest='git restore'
alias ks='git s'
alias ksl='git sl'
alias ksvv='git svv'
alias kundo='git undo'
alias kunstage='git unstage'

alias b=bat
alias c=code
alias c.='code .' # open current directory in vscode
alias ghv='gh pr view --web || gh repo view --web'
alias lk=lazygit # easier than typing 'lg'
alias v=nvim
alias vim=nvim
