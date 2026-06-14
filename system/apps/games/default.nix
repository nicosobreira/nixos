{...}: {
  imports = [
    ./steam.nix
  ];

  programs.gamemode.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
}
