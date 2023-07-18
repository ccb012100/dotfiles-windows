#!/usr/bin/env bash
winget.exe list --disable-interactivity >|"$HOME"/src/cm-notes/sync/applications/winget/packages.txt
choco.exe list >|"$HOME"/src/cm-notes/sync/applications/chocolatey/packages.txt
echo "Completed successfully"
