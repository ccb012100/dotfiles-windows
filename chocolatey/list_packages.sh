#!/usr/bin/env bash

choco list --local-only | awk '{ print $1 }'
