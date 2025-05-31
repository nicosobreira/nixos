#!/usr/bin/env sh

# Code from: https://github.com/librephoenix/nixos-config/blob/main/sync-user.sh

# Script to synchronize system state
# with configuration files for nixos system
# and home-manager

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Fix root-owned sqlite errors
#sudo chown -R 1000:users ~/.cache/nix;

# Install and build home-manager configuration
home-manager switch --flake $SCRIPT_DIR#user;
