{pkgs, ...}: {
  programs.yazi.enable = true;
  programs.lazygit.enable = true;
  programs.fzf.enable = true;

  programs.bat.enable = true;

  home.packages = with pkgs; [
    tree
    stow
  ];
}
