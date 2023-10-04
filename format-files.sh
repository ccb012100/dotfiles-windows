#!/usr/bin/env bash
# cat files-to-format |
repo_dir=$(dirname -- "$(readlink -f -- "$0")")

while read -r file; do
    filepath="$repo_dir/$file"
    jq . "$filepath" | sponge "$filepath"
done <"$repo_dir"/files-to-format
