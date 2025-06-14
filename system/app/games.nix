{ lib, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  # programs.steam.gamescopeSession = true;
  programs.gamemode.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Xpad setup
  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_zen.xpad-noone

    # Games
    pcsx2
    mame
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];
}
