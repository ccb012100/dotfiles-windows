#!/usr/bin/env bash
SYNC="$HOME/src/sync/applications"
winget list >|"$SYNC"/winget/packages.txt
choco list >|"$SYNC"/chocolatey/packages.txt
