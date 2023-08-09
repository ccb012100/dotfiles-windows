#!/usr/bin/env bash
# shellcheck disable=SC2034
stty -ixon

export EDITOR="nvim"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

eval "$(starship init bash)"
eval "$(zoxide init bash)"

source "$HOME"/.config/bash/aliases.sh
source "$HOME"/.config/bash/functions.sh

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
