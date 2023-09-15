#!/usr/bin/env bash
winget.exe list --disable-interactivity >|"$HOME"/work/work-notes/sync/applications/winget/packages.txt
choco.exe list >|"$HOME"/work/work-notes/sync/applications/chocolatey/packages.txt
echo "Completed successfully"
