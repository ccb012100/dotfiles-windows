#!/usr/bin/env bash
# shellcheck disable=SC2034
stty -ixon

# less configuration
#: -X leaves file contents on the screen when less exits.
#: -F makes less quit if the entire output can be displayed on one screen.
#: -R displays ANSI color escape sequences in "raw" form.
export LESS="-XFR"

export EDITOR="nvim"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

source "$HOME"/.config/bash/aliases.sh
source "$HOME"/.config/bash/functions.sh
source "$HOME"/.config/bash/tools.sh

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
