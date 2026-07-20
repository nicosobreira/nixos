{
  pkgs,
  lib,
  withNvidiaOffload,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];

  programs.steam = {
    enable = true;

    package = withNvidiaOffload pkgs.steam;

    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.steam.protontricks.enable = true;

  # Proton needs more memory
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };
}
