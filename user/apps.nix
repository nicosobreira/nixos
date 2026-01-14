{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.okular
    musescore
    kdePackages.dolphin
    kdePackages.kio-admin
  ];

  programs.obsidian.enable = true;
}
