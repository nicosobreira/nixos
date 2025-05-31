#!/usr/bin/env sh

# Code from: https://github.com/librephoenix/nixos-config/blob/main/upgrade.sh

# Script to update system and sync
# Does not pull changes from git

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Update flake
$SCRIPT_DIR/update.sh;

# Synchronize system
$SCRIPT_DIR/rebuild.sh;
