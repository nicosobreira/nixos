#!/usr/bin/env sh

sudo nix-collect-garbage --delete-older-than 4d

# sudo nix-env --delete-generations +4d
#
# sudo nix-collect-garbage -d
#
# sudo nix-store --verify --repair
