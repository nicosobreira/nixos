#!/usr/bin/env bash

set -eou pipefail

# ---------------------------------------------
# Helper functions
# ---------------------------------------------

error()
{
    local msg="${1:-}"
    local code="${2:-1}"

    local prefix="ERROR: "

	printf "%s%s\n" "$prefix" "$msg" >&2

    exit "$code"
}


function get_script_path()
{
    (cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
}

# ---------------------------------------------
# Main actions
# ---------------------------------------------

function show_help()
{
	cat <<- EOF
Usages: ${BASH_SOURCE[0]} [Actions]
Actions:
    rebuild        Create new system iteration
    upgrade        Update and rebuild
    update         Update the flake
    cleanup        Clean the system

    help           Show this help
EOF
}

function clean()
{
    sudo nix-collect-garbage --delete-older-than 4d
}

function rebuild()
{
    sudo nixos-rebuild switch --flake "$(get_script_path)"
}

function update()
{
    pushd "$(get_script_path)" &> /dev/null;
    sudo nix flake update
    popd &> /dev/null;
}

function upgrade()
{
    update
    rebuild
}

# ---------------------------------------------
# Main
# ---------------------------------------------

if [[ ! -f "$(get_script_path)/flake.nix" ]]; then
    error "Couldn't find flake.nix in \"$(get_script_path)\""
fi

ACTION="${1:-"NONE"}"

case "$ACTION" in
    rebuild)
        rebuild
        ;;
    upgrade)
        upgrade
        ;;
    update)
        update
        ;;
    clean)
        clean
        ;;
    --help|-h|help)
        show_help
        ;;
    *)
        show_help
        error "Unknow action \"$ACTION\""
        ;;
esac
