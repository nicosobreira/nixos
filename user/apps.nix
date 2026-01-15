{pkgs, ...}: {
  home.packages = with pkgs; [
    musescore

    kdePackages.okular
    kdePackages.dolphin
    kdePackages.kio-admin

    pwvucontrol
  ];

  programs.obsidian.enable = true;
}
