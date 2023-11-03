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
# cd into the directory containing the file passed as an argument
function cdf {
    cd "$(dirname "$*")" || exit
}
function brew() {
    echo "This is Git Bash; did you mean 'choco/winget ${*}'?"
    return 1
}
function jc() { # cd with zoxide and then open in vscode
    j "$@" && code .
}
# cargo cli commands
function jj() {
    case $1 in
    b)
        shift
        if [[ -n "${*}" ]]; then
            echo cargo build "${*}"
            cargo build "${*}"
        else
            echo cargo build .
            cargo build .
        fi
        ;;
    c)
        shift
        if [[ -n "${*}" ]]; then
            echo cargo check "${*}"
            cargo check "${*}"
        else
            echo cargo check .
            cargo check .
        fi
        ;;
    r)
        shift
        if [[ -n "${*}" ]]; then
            echo cargo run "${*}"
            cargo run "${*}"
        else
            echo cargo run .
            cargo run .
        fi
        ;;
    *)
        echo cargo "$@"
        cargo "$@"
        ;;
    esac
}
# dotnet cli commands
function dn() {
    case $1 in
    r | run)
        shift
        if [[ -n "${*}" ]]; then
            echo go run "${*}"
            go run "${*}"
        else
            echo go run .
            go run .
        fi
        ;;
    b | build)
        shift
        if [[ -n "${*}" ]]; then
            echo dotnet build "${*}"
            dotnet build "${*}"
        else
            echo dotnet build .
            dotnet build .
        fi
        ;;
    t | test)
        shift
        if [[ -n "${*}" ]]; then
            echo dotnet test "${*}"
            dotnet test "${*}"
        else
            echo dotnet test .
            dotnet test .
        fi
        ;;
    *)
        dotnet "$@"
        ;;
    esac
}
# golang cli commands
function gg() {
    case $1 in
    b)
        shift
        if [[ -n "${*}" ]]; then
            echo go build "${*}"
            go build "${*}"
        else
            echo go build .
            go build .
        fi
        ;;
    r)
        shift
        if [[ -n "${*}" ]]; then
            echo go run "${*}"
            go run "${*}"
        else
            echo go run .
            go run .
        fi
        ;;
    *)
        echo go "${*}"
        go "${*}"
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
