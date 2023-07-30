#!/usr/bin/env bash

git_dir="$HOME/src/windows-dotfiles"
win_homepath="$HOME/win" # `~/win` is symlinked to `/mnt/c/Users/<user_name>`
repo_homepath="$git_dir/HOMEPATH"

# c_drive="/mnt/c"
# repo_c="$git_dir/c"

# --verbose --dry-run \ # move to line 12 for dry run
rsync --relative --dirs --recursive --times --progress \
    --files-from=files-to-sync-from-home "$win_homepath/" "$repo_homepath"

# --verbose --dry-run \
rsync --relative --dirs --recursive --times --progress \
    --files-from=files-to-sync-from-cm-notes \
    "$win_homepath/src/cm-notes/sync/" "$git_dir"
