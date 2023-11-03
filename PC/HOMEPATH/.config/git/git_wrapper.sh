#!/usr/bin/env bash
set -Eeou pipefail
# wrap git calls to perform more complex aliases

# ANSI colors
blue='\033[0;34m'
clearformat='\033[0m' # clear formatting
red='\033[0;31m'

function info() {
    echo -e "${blue}${*}${clearformat}"
}
function error() {
    echo >&2 -e "${red}Error: ${*}${clearformat}"
}

if [[ "${debug_wrapper:-}" && $debug_wrapper ]]; then
    info "--> git wrapper called with: $*"
fi

if [[ $# -eq 0 ]]; then
    command git
fi

case $1 in
alias) # list aliases, optionally filtering on search string
    shift

    if [[ $# -eq 0 ]]; then
        git config --get-regexp ^alias\\. | sed -e s/^alias\.// -e s/\ /\ =\ / | sort
    else
        git config --get-regexp ^alias\\. | sed -e s/^alias\.// -e s/\ /\ =\ / | rg --fixed-strings "$*" | sort
    fi
    ;;
author) # reset author for last commit or last $1 commits
    shift

    if [[ $# -eq 0 ]]; then
        num=1
    elif [[ $# -eq 1 ]]; then
        num="$1"
    else
        error "Can't parse argument: author $*"
        exit 1
    fi

    git rebase HEAD~"$num" -x "git commit --amend --no-edit --reset-author"
    ;;
files | shf) # list files changed in last n commits
    shift
    num=1

    if [[ $# -gt 0 ]]; then
        num=$1
        shift
    fi

    command git show --pretty="" --name-only -n"$num" "$@"
    ;;
l) # git log, formatted to 1 line per commit
    shift

    num=25

    # check if $1 is a number
    if [[ $# -gt 0 ]] && [[ $1 =~ ^[1-9][0-9]*$ ]]; then
        num=$1
        shift
    fi

    command git log -n"$num" --pretty='format:%C(yellow)%h %C(magenta)%as %C(blue)%aL %C(cyan)%s%C(reset)' "$@"
    ;;
la | last) # log compact summary (commit message and list of changed files)
    shift

    num=1

    # check if $1 is a number
    if [[ $# -gt 0 ]] && [[ $1 =~ ^[1-9][0-9]*$ ]]; then
        num=$1
        shift
    fi

    command git log --compact-summary -"$num" "$@"
    ;;
sh) # show
    shift
    num=1

    if [[ $# -gt 0 ]]; then
        num=$1
        shift
    fi

    command git show --expand-tabs=4 -n"$num" "$@"
    ;;
restore | rest) # wraps `restore`
    shift

    if [[ $# -eq 0 ]]; then
        error 'Need to supply arguments to "restore"'
        exit 1
    elif [[ $# -eq 1 ]]; then
        case $1 in
        all)
            git restore :/
            exit 0
            ;;
        esac
    fi

    git restore "$@"
    ;;
undo) # reset last commit or last n commits and keeps undone changes in working directory
    shift

    if [[ $# -eq 0 ]]; then
        num=1
    elif [[ $# -eq 1 ]]; then
        num="$1"
    else
        error "Can't parse argument: undo $*"
        exit 1
    fi

    git reset HEAD~"$num" --mixed
    ;;
unstage | u) # move staged files back to staging area; alias for `restore`
    shift

    if [[ $# -eq 0 ]]; then
        error 'Need to supply arguments to "unstage"'
        exit 1
    elif [[ $# -eq 1 ]]; then
        case $1 in
        all)
            git restore --staged :/
            exit 0
            ;;
        esac
    fi

    git restore --staged "$@"
    ;;
update | unwind) # update local branch from origin without checking it out
    shift

    if [[ $# -eq 0 ]]; then
        error must supply a branch name
    elif [[ $# -eq 1 ]]; then
        git fetch origin "$1":"$1"
    else
        error "Can't parse argument: update $*"
        exit 1
    fi
    ;;
*) # pass through to git
    if [[ "${debug_wrapper:-}" && $debug_wrapper ]]; then
        info "--> passing to native git: $* "
    fi

    command git "$@"
    ;;
esac
