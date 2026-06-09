{pkgs, ...}: {
  home.packages = with pkgs; [
    kitty
    nerd-fonts.terminess-ttf
  ];
}
