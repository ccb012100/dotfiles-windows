#!/usr/bin/env bash
set -Eeou pipefail

# update local windows config files from dotfiles repo

repo=$(dirname -- "$(readlink -f -- "$0")")
repoconf="$repo"/PC/HOMEPATH/.config
winconfig="$HOME"/win/.config

case $1 in
bash)
    cp -u "$repoconf"/bash/{aliases,tools,functions}.sh "$winconfig"/bash/
    ;;
bashrc)
    cp -u "$repo"/PC/HOMEPATH/.bashrc "$HOME"/win/
    ;;
git)
    cp -u "$repoconf"/git/{aliases.gitconfig,git_wrapper.sh} "$winconfig"/git/
    ;;
wez)
    cp -u "$repoconf"/wezterm/wezterm.lua "$winconfig"/wezterm/
    cp -u "$repoconf"/wezterm/colors/* "$winconfig"/wezterm/colors/
    ;;
*)
    echo ERROR: unsupported option
    ;;
esac
