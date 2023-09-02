#!/usr/bin/env bash

git_dir="$HOME/src/dotfiles-windows"
win_homepath="$HOME/win" # `~/win` is symlinked to `/mnt/c/Users/<user_name>`
repo_homepath="$git_dir/PC/HOMEPATH"

# add:
#   --verbose --dry-run
# when debugging
rsync --relative --dirs --recursive --times --progress \
    --files-from=files-to-sync-from-home "$win_homepath/" "$repo_homepath"

rsync --relative --dirs --recursive --times --progress \
    --files-from=files-to-sync-from-win-dir \
    "$win_homepath/src/sync/" "$git_dir"

./format-files.sh
