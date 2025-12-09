{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.okular
    musescore
  ];

  programs.obsidian.enable = true;
}
