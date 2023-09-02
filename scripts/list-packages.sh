#!/usr/bin/env bash
SYNC="$HOME/src/sync/applications"
choco list >|"$SYNC"/chocolatey/packages.txt
winget list >|"$SYNC"/winget/packages.txt
