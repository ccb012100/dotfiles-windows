#!/usr/bin/env bash
set -Eeou pipefail

# update local windows config files from dotfiles repo

repo=$(dirname -- "$(readlink -f -- "$0")")
repoconf="$repo"/PC/HOMEPATH/.config
winconfig="$HOME"/win/.config

case $1 in
bash)
    cp -i "$repoconf"/bash/{aliases,tools,functions}.sh "$winconfig"/bash/
    ;;
bashrc)
    cp -i "$repo"/PC/HOMEPATH/.bashrc "$HOME"/win/
    ;;
git)
    cp -i "$repoconf"/git/{aliases.gitconfig,git_wrapper.sh} "$winconfig"/git/
    ;;
wez)
    cp -i "$repoconf"/wezterm/wezterm.lua "$winconfig"/wezterm/
    ;;
*)
    echo ERROR: unsupported option
    ;;
esac
