#!/usr/bin/env bash
# cat files-to-format |
while read -r file; do
    jq . "$file" | sponge "$file"
done <files-to-format
