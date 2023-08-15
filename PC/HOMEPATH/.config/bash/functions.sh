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
# Git Bash doesn't have the `man` command
function man() {
    "$@" --help | less
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
# use built-in Windows 'open' command
function open() {
    if [[ -n "${*}" ]]; then
        start "${*}"
    else
        start .
    fi
}
