#!/usr/bin/env bash
# shellcheck disable=SC2034
set -o noclobber
shopt -s expand_aliases
stty -ixon

# history settings
HISTTIMEFORMAT="%F %T " ## add `YYYY-MM-DD HH:MM:SS timestamp to history entries`
HISTSIZE=5000 # history buffer
HISTFILESIZE=9999 # history file
shopt -s histappend # immediately append commands to history
## set PROMPT_COMMAND to immediately add commands to all runinng shells
### -a -> append to history file immediately
### -c -> clear current history
### -r -> load updated history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# less configuration
#: -X leaves file contents on the screen when less exits.
#: -F makes less quit if the entire output can be displayed on one screen.
#: -R displays ANSI color escape sequences in "raw" form.
export LESS="-XFR"

export EDITOR="nvim"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# shellcheck disable=SC2155
export GPG_TTY="$(tty)"

bashcompdir="$HOME/.local/share/bash-completion/completions"
if [[ ! -d "$bashcompdir" ]]; then
    mkdir -pv "$bashcompdir"
fi

source "$HOME"/.config/bash/aliases.sh
source "$HOME"/.config/bash/functions.sh
source "$HOME"/.config/bash/tools.sh
source "$HOME"/.local/config-local.sh

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
# also bound by default to Ctrl+Alt+e
bind "\C-.":shell-expand-line
