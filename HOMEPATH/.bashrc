alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias cd-dotfiles='cd ~/.dotfiles'

alias ls='ls --color --block-size=K'
alias la='ls -A'
alias ll='ls -l'
alias lal='ls -Al'
alias lla='ls -Al'

alias g='git'

alias cb='cargo build'
alias cr='cargo run'
alias cc='cargo check'

alias gb='go build .'
alias gr='go run .'

alias dc='docker compose'

# Add git branch if its present to PS1
force_color_prompt=yes
color_prompt=yes

# Only load Liquidprompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

source ~/.bash_machine_specific_aliases

# functions to cd then ls in one step
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
