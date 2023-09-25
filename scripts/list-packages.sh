#!/usr/bin/env bash
sync="$HOME/src/sync/applications"
choco list >|"$sync"/chocolatey/packages.txt
winget list --disable-interactivity >|"$sync"/winget/packages.txt
echo "Completed successfully"
