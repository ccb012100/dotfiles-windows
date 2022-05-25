export EDITOR="vim"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias dotfiles='cd ~/.dotfiles'
alias dotemacs='cd $APPDATA/.emacs.d/'

alias ls='ls --color --block-size=K'
alias la='ls -A'
alias ll='ls -l'
alias lal='ls -Al'
alias lla='ls -Al'
alias llt='ls -lt'
alias llat='ls -Alt'
alias tree='cmd //c tree' # use cmd.exe "tree command"

alias g='git'

alias c.='code .' # open current directory in vscode
alias dc='docker compose'
alias pn='pnpm'
alias npm='echo "use pn/pnpm"'

# Add git branch if it's present to PS1
force_color_prompt=yes
color_prompt=yes

# Only load Liquidprompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

source ~/.bash_machine_specific_aliases
source ~/ccb012100/starred_music/search.sh

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
# for some reason PATH isn't picking up GitHub CLI
function gh() {
    /c/Program\ Files/GitHub\ CLI/gh.exe "$@"
}
# dotnet cli commands
function dot() {
    case $1 in
        b )
            shift
            dotnet build "$@"
        ;;
        r )
            shift
            dotnet run "$@"
        ;;
        * )
            dotnet "$@"
        ;;
    esac
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