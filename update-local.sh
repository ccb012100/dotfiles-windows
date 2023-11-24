#!/usr/bin/env bash
set -Eeou pipefail

# update local windows config files from dotfiles repo

repo=$(dirname -- "$(readlink -f -- "$0")")
repoconf="$repo"/PC/HOMEPATH/.config
repoappdatalocal="$repo"/PC/HOMEPATH/AppData/Local
winappdatalocal="$HOME"/win/AppData/Local
winconfig="$HOME"/win/.config

case $1 in
bash)
    cp -uv "$repoconf"/bash/{aliases,tools,functions}.sh "$winconfig"/bash/
    cp -uv "$repo"/PC/HOMEPATH/.bashrc "$HOME"/win/
    ;;
git)
    cp -uv "$repoconf"/git/{aliases.gitconfig,git_wrapper.sh} "$winconfig"/git/
    ;;
nvim)
    cp -uv "$repoappdatalocal"/nvim/init.vim "$winappdatalocal"/nvim/
    ;;
wez)
    cp -uv "$repoconf"/wezterm/wezterm.lua "$winconfig"/wezterm/
    cp -uv "$repoconf"/wezterm/colors/* "$winconfig"/wezterm/colors/
    ;;
*)
    echo ERROR: unsupported option
    ;;
esac
