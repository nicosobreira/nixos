{ pkgs, ... }:

{
  programs.steam.enable = true;
  # programs.steam.gamescopeSession = true;
  # programs.gamemode.enable = true;

  hardware.steam-hardware.enable = true;

  # Xone setup
  hardware.xone.enable = true;
  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_zen.xone
  ];
}
