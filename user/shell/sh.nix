{ config, pkgs, ... }:
let
  myAliases = {
    dwm-edit = "$EDITOR $HOME/suckless/dwm/config.h";
    l = "lazygit";
    v = "nvim";
    svim = "sudo vim -u $HOME/.vimrc";
    make = "make -j$(nproc)";
    c = "clear";
    duh = "du --human-readable";
    mkdir = "mkdir -p";
    dir = "dir --color=auto";
    vdir = "vdir --color=auto";
    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";
    ls = "ls -h --color=auto";
    la = "ls --almost-all --dereference-command-line --color=auto --format=single-column --human-readable --size --group-directories-first --sort=version";
    tree = "tree -a -C";
  };
in
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };
}
