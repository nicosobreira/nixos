{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.okular
    genymotion
    musescore
  ];
}
