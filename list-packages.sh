#!/usr/bin/env bash
set -Eeou pipefail

repo=$(dirname -- \"$(readlink -f -- \"\\$0\")\")

msg() {
  echo >&2 -e "${1-}"
}

if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
  NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
else
  NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
fi

msg "${ORANGE}Updating chocolatey package list...${NOFORMAT}"

/mnt/c/Windows/SysWOW64/cmd.exe /c choco list >|"$repo"/applications/chocolatey/packages.txt

msg "${ORANGE}Updating winget package list...${NOFORMAT}"

/mnt/c/Windows/SysWOW64/cmd.exe /c winget list --disable-interactivity >|"$repo"/applications/winget/packages.txt

msg "${GREEN}Completed successfully${NOFORMAT}"
