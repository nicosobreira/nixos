{
  pkgs,
  lib,
  ...
}: {
  programs.steam = {
    enable = true;

    package = pkgs.steam.overrideAttrs (old: {
      postInstall =
        (old.postInstall or "")
        + ''
          rm -f $out/share/applications/steam.desktop
        '';
    });

    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.steam.protontricks.enable = true;

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "nvidia-steam" ''
      exec nvidia-offload steam "$@"
    '')

    (pkgs.makeDesktopItem {
      name = "steam-nvidia";
      desktopName = "Steam (NVIDIA)";
      exec = "nvidia-steam %U";
      icon = "steam";
      type = "Application";
      categories = ["Network" "Game"];
    })
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];
}
