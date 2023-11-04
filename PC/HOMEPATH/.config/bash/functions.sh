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
    echo Use 'cmd \c "mklink LINK TARGET"' to create a symlink on Windows
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

function jj() { # cargo cli commands
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
function dn() { # dotnet cli commands
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
function gg() { # golang cli commands
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
