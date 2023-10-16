#!/usr/bin/env bash

# dotnet CLI
#: bash parameter completion for the dotnet CLI
function _dotnet_bash_complete() {
  local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n' # On Windows you may need to use use IFS=$'\r\n'
  local candidates

  read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)

  read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
}

complete -f -F _dotnet_bash_complete dotnet

# fd
#: Use fd (https://github.com/sharkdp/fd) instead of the default find
#: command for listing path candidates.
#: - The first argument to the function ($argv[1]) is the base path to start traversal
#: - See the source code (completion.{bash,zsh}) for the details.
function _fzf_compgen_path() {
  # shellcheck disable=SC2154
  fd --hidden --follow --exclude ".git" . "${argv[1]}"
}

# Use fd to generate the list for directory completion
function _fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "${argv[1]}"
}

export fzf_fd_opts='--hidden' # include hidden files

#: keybindings
#: https://github.com/junegunn/fzf/blob/master/shell/key-bindings.bash
fzfkeybinds="$HOME"/bin/fzf-keybindings.bash
if [[ ! -f "$fzfkeybinds" ]]; then
    curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash --output "$fzfkeybinds"
fi
source "$fzfkeybinds"

#: bash completions
#: https://github.com/junegunn/fzf/blob/master/shell/completion.bash
fzfcompletions="$HOME/.local/share/bash-completion/completions/fzf"
if [[ ! -f "$fzfcompletions" ]]; then
  curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash --output "$fzfcompletions"
fi

# set Ripgrep configuration file
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"

# starship
eval "$(starship init bash)"

function set_win_title() {
  echo -ne "\033]0; $(basename "$PWD") \007"
}

starship_precmd_user_func="set_win_title"

# zoxide
eval "$(zoxide init bash)"
