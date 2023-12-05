#!/usr/bin/env bash

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
function cdf { # cd into the directory containing the file passed as an argument
    cd "$(dirname "$*")" || exit
}
function brew() { # homebrew does not exist on Windows
    echo "This is Git Bash; did you mean 'choco/winget ${*}'?"
    return 1
}
function ln() { # getting ln working on Git Bash is annoying to set up
    echo Use 'cmd //c "mklink LINK TARGET"' to create a symlink on Windows
    return 1
}
function jc() { # cd with zoxide and then open in vscode
    j "$@" && code .
}
function man() { # Git Bash doesn't have the `man` command
    echo 'using --help'
    "$@" --help | less
}
function open() { # use built-in Windows 'open' command
    if [[ -n "${*}" ]]; then
        start "${*}"
    else
        start .
    fi
}
