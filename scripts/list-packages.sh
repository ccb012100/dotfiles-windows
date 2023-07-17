#!/usr/bin/env bash
winget.exe list --disable-interactivity >|"$HOME"/src/cm-notes/sync/winget/winget-installed-packages.txt
choco.exe list >|"$HOME"/src/cm-notes/sync/chocolatey/choco-installed-packages.txt
echo "Completed successfully"
