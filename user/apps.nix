{pkgs, ...}: {
  home.packages = with pkgs; [
    kdePackages.okular
    musescore
    stremio
  ];

  programs.obsidian.enable = true;
}
