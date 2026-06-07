{pkgs, ...}: {
  home.packages = with pkgs; [
    nerd-fonts.terminess-ttf
  ];

  programs.kitty = {
    enable = true;
    settings = {
      font_family = "Terminess Nerd Font Regular";
      font_size = 12.0;

      italic_font = "Terminess Nerd Font Regular";
      bold_italic_font = "Terminess Nerd Font Bold";

      text_composition_strategy = 1.0;
    };
  };
}
