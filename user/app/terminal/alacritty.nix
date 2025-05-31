{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];

  programs.alacritty.enable = true;
  programs.alacritty.theme = "catppuccin_mocha";
  programs.alacritty.settings = {
    env.TERM = "xterm-256color";

    # font.normal = {
    #   family = "CaskaydiaCove Nerd Font";
    #   style = "Regular";
    # };
    font.size = 8;
  };
}
