#!/usr/bin/env bash

git_dir="$HOME/src/dotfiles-windows"
win_homepath="$HOME/win" # `~/win` is symlinked to `/mnt/c/Users/<user_name>`
repo_homepath="$git_dir/PC/HOMEPATH"

# --verbose --dry-run \

rsync --relative --dirs --recursive --times --progress \
    --files-from="$git_dir"/files-to-sync-from-home "$win_homepath/" "$repo_homepath"

rsync --relative --dirs --recursive --times --progress \
    --files-from="$git_dir"/files-to-sync-from-work-notes \
    "$win_homepath/work/work-notes/sync/" "$git_dir"

"$git_dir"/format-files.sh
