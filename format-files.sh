#!/usr/bin/env bash
# cat files-to-format |
repo_dir="$HOME/src/dotfiles-windows"
while read -r file; do
    filepath="$repo_dir/$file"
    jq . "$filepath" | sponge "$filepath"
done <"$repo_dir"/files-to-format
