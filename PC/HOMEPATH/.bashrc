#!/usr/bin/env bash
# shellcheck disable=SC2034
set -o noclobber
shopt -s expand_aliases
stty -ixon

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

if [[ ! -f "$HOME"/bin/git_wrapper.sh ]]; then
    # shellcheck disable=SC1001
    cmd //c "mklink %HOMEPATH%\\bin\\git_wrapper.sh %HOMEPATH%\\.config\\git\\git_wrapper.sh"
fi

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
# also bound by default to Ctrl+Alt+e
bind "\C-.":shell-expand-line
