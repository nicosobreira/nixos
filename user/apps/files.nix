{pkgs, ...}: {
  home.packages = with pkgs.kdePackages; [
    okular

    dolphin
    kio
    kio-extras
    kio-admin
  ];
}
