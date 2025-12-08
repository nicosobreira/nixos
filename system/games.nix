{ pkgs, ... }:

{
  imports = [
    ./games/steam.nix
    ./games/minecraft-bedrock.nix
    # ./games/lutris.nix
    # ./games/retro.nix
  ];

  programs.gamemode.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  hardware.xone.enable = true;

  environment.systemPackages = with pkgs; [
    # Xpad setup
    linuxKernel.packages.linux_zen.xpad-noone
    mame-tools
  ];
}
