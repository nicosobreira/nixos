{ lib, ... }:

{
  # xresources.path = "/home/${userSettings.username}/.config/X11/Xresources";

  imports = [
    ./themes/catppuccin_mocha.nix
  ];
  catppuccin_mocha.enable = lib.mkDefault true;
}
