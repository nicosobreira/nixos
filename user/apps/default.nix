{pkgs, ...}: {
  imports = [
    ./games.nix
    ./files.nix
  ];

  home.packages = with pkgs; [
    qbittorrent

    obsidian
    gnome-clocks
    libqalculate
  ];
}
