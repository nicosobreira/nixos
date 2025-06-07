{ lib, ... }:

{
  imports = [
    ./user/xresources/themes/catppuccin_mocha.nix
  ];

  catppuccin_mocha.enable = lib.mkDefault true;
}
