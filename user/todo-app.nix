{pkgs, ...}: {
  programs.taskwarrior = {
    enable = true;
  };

  home.packages = with pkgs; [
    taskwarrior-tui
    vit
  ];
}
