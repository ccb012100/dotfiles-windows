#!/usr/bin/env bash
# shellcheck disable=SC2034
export EDITOR="nvim"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

eval "$(starship init bash)"
eval "$(zoxide init bash)"

source "$HOME"/.config/bash/*.sh
