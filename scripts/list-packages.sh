#!/usr/bin/env bash
DOTFILES="$HOME/.dotfiles"
winget list >|"$DOTFILES"/winget/winget-installed-packages.txt
choco list >|"$DOTFILES"/chocolatey/choco-installed-packages.txt
