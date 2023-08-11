#!/usr/bin/env bash
winget.exe list --disable-interactivity >|"$HOME"/work/cm-notes/sync/applications/winget/packages.txt
choco.exe list >|"$HOME"/work/cm-notes/sync/applications/chocolatey/packages.txt
echo "Completed successfully"
