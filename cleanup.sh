#!/usr/bin/env sh

sudo nix-env --delete-generations +4d

sudo nix-collect-garbage -d

sudo nix-store --gc

sudo nix-store --verify --repair
