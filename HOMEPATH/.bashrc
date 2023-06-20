#!/usr/bin/env bash
# shellcheck disable=SC2034

export EDITOR="vim"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

eval "$(ssh-agent -s)" # start ssh agent

# starship prompt
eval "$(starship init bash)"

source "$HOME"/.config/bash/*.sh