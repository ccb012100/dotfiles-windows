#!/usr/bin/env bash
export EDITOR="vim"

eval `ssh-agent` # start ssh agent

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

alias k=git

alias c.='code .' # open current directory in vscode
alias dn=dotnet

# Add git branch if it's present to PS1
force_color_prompt=yes
color_prompt=yes

# Only load Liquidprompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

# functions to `cd` then `ls` in one step
function cls() {
    cd "$@" && ls -s
}
function cla {
    cd "$@" && ls -a
}
function cll {
    cd "$@" && ls -l
}
function clal {
    cd "$@" && ls -al
}
function clla {
    cd "$@" && ls -la
}
# Git Bash doesn't have the `man` command
function man() {
    "$@" --help | less
}
# golang cli commands
function gl() {
    case $1 in
            b )
            shift
            go build .
        ;;
        r )
            shift
            go run .
        ;;
        * )
            go "$@"
        ;;
    esac
}
# cargo cli commands
function cg() {
    case $1 in
        b )
            shift
            cargo build
        ;;
        c )
            shift
            cargo check
        ;;
        r )
            shift
            cargo run
        ;;
        * )
            cargo "$@"
        ;;
    esac
}

# cache ssh passphrase for current session
eval `ssh-agent -s`
ssh-add ~/.ssh/id_ed25519
