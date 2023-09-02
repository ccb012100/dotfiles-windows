#!/usr/bin/env bash

git_dir="$HOME/src/windows-dotfiles"
win_homepath="$HOME/win" # `~/win` is symlinked to `/mnt/c/Users/<user_name>`
repo_homepath="$git_dir/PC/HOMEPATH"

# add:
#   --verbose --dry-run
# when debugging
rsync --relative --dirs --recursive --times --progress \
    --files-from=files-to-sync-from-home "$win_homepath/" "$repo_homepath"

./format-files.sh