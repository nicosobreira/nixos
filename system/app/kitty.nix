{...}: {
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "Terminess Nerd Font Mono";
      bold_font = "Terminess Nerd Font Mono Bold";

      italic_font = "Terminess Nerd Font Mono";
      bold_italic_font = "Terminess Nerd Font Mono Bold";

      font_size = 12.0;

      text_composition_strategy = "1.0 0";
    };
  };
}
