{pkgs, ...}: {
  imports = [
    ./games
    ./files.nix
  ];

  home.packages = with pkgs; [
    qbittorrent

    obsidian
    gnome-clocks
    libqalculate

    loupe # Image viewer
  ];
}
