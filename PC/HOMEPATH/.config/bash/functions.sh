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
function brew() {
    echo "This is Git Bash; did you mean 'choco ${*}'?"
    return 1
}
# cargo cli commands
function cg() {
    case $1 in
    b)
        shift
        cargo build
        ;;
    c)
        shift
        cargo check
        ;;
    r)
        shift
        cargo run
        ;;
    *)
        cargo "$@"
        ;;
    esac
}
# dotnet cli commands
function dn() {
    case $1 in
    r | run)
        shift
        go build .
        ;;
    b | build)
        shift
        dotnet build "$@"
        ;;
    t | test)
        shift
        dotnet test "$@"
        ;;
    *)
        dotnet "$@"
        ;;
    esac
}
# golang cli commands
function gl() {
    case $1 in
    b)
        shift
        go build .
        ;;
    r)
        shift
        go run .
        ;;
    *)
        go "$@"
        ;;
    esac
}
# Git Bash doesn't have the `man` command
function man() {
    echo 'using --help'
    "$@" --help | less
}
# use built-in Windows 'open' command
function open() {
    if [[ -n "${*}" ]]; then
        start "${*}"
    else
        start .
    fi
}
