#!/usr/bin/env bash

repo="$HOME/src/windows-dotfiles"
win_home="$HOME/win" # `~/win` is symlinked to `/mnt/c/Users/<user_name>`
repo_home="$repo/HOMEPATH"

# c_drive="/mnt/c"
# repo_c="$git_dir/c"

# --verbose --dry-run \ # move to line 12 for dry run
rsync --relative --dirs --recursive --times --progress \
    --files-from=files-to-sync-from-home "$win_home/" "$repo_home"

# rsync --dirs --recursive --times --progress \
#     --verbose --dry-run \
#     --files-from=files-to-sync-from-c-drive "c_drive" "$repo_c"
