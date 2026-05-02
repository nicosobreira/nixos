{pkgs, ...}: {
  home.packages = with pkgs; [
    musescore
    qbittorrent
    krita

    kdePackages.okular

    kdePackages.dolphin
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.kio-admin

    pwvucontrol

    obsidian
    gnome-clocks
    libqalculate
  ];
}
