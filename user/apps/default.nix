{pkgs, ...}: {
  imports = [
    ./games.nix
    ./files.nix
  ];

  home.packages = with pkgs; [
    qbittorrent

    pwvucontrol

    obsidian
    gnome-clocks
    libqalculate
  ];
}
