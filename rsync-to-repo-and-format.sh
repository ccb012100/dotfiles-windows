#!/usr/bin/env bash
set -Eeou pipefail

git_dir=$(dirname -- "$(readlink -f -- "$0")")
win_homepath="$HOME/win" # `~/win` is symlinked to `/mnt/c/Users/<user_name>`
repo_homepath="$git_dir/PC/HOMEPATH"

echo 'Syncing to repository...'
# --verbose --dry-run \
rsync --relative --dirs --recursive --times --progress \
    --files-from="$git_dir"/files-to-sync-from-home "$win_homepath/" "$repo_homepath"

echo 'Finished syncing.'
echo 'Formatting...'

"$git_dir"/format-files.sh

echo 'Finished!'
