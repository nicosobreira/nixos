{ pkgs, ... }:

{
  imports = [
    ./games/steam.nix
    ./games/retro.nix
    ./games/minecraft.nix
  ];

  programs.gamemode.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  hardware.xone.enable = true;

  environment.systemPackages = with pkgs; [
    # Xpad setup
    linuxKernel.packages.linux_zen.xpad-noone

  ];
}
