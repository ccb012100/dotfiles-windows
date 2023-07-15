#!/usr/bin/env bash
winget list >|"$HOME"/src/cm-notes/winget/winget-installed-packages.txt
choco list >|"$HOME"/src/cm-notes/chocolatey/choco-installed-packages.txt
