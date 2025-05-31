#!/usr/bin/env sh

# Code from: https://github.com/librephoenix/nixos-config/blob/main/sync.sh

# Script to synchronize system state
# with configuration files for nixos system
# and home-manager

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

$SCRIPT_DIR/rebuild-system.sh
$SCRIPT_DIR/rebuild-user.sh
