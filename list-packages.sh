#!/usr/bin/env bash
set -Eeou pipefail

repo=$(dirname -- "$(readlink -f -- "$0")")

echo 'Updating chocolatey package list...'

/mnt/c/Windows/SysWOW64/cmd.exe /c choco list >|"$repo"/applications/chocolatey/packages.txt

echo 'Updating winget package list...'

/mnt/c/Windows/SysWOW64/cmd.exe /c winget list --disable-interactivity >|"$repo"/applications/winget/packages.txt

echo 'Finished!'
