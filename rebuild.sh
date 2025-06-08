#!/usr/bin/env sh

# Code from: https://github.com/librephoenix/nixos-config/blob/main/sync-system.sh

# Script to synchronize system state
# with configuration files for nixos system
# and home-manager

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Rebuild system
sudo nixos-rebuild switch --flake $SCRIPT_DIR
