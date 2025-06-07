{ ... }:

{
  programs.alacritty.enable = true;
  # programs.alacritty.theme = "catppuccin_mocha";
  programs.alacritty.settings = {
    env.TERM = "xterm-256color";

    font.size = 8;
  };
}
