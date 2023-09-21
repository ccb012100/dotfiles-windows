#!/usr/bin/env bash
# cat files-to-format |
repo_dir="$HOME/src/windows-dotfiles/"
while read -r file; do
    filepath="$HOME/src/windows-dotfiles/$file"
    jq . "$filepath" | sponge "$filepath"
done <"$repo_dir"/files-to-format
