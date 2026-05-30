{
  pkgs,
  userSettings,
  ...
}: {
  stylix = {
    enable = true;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/windows-95.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # base24Scheme = "${pkgs.base24-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./../wallpapers/nausicaa/1.png;
    polarity = "dark";

    fonts = {
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };
      monospace = {
        name = userSettings.font;
        package = userSettings.fontPkg;
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
    };

    fonts.sizes = {
      applications = 10;
      terminal = 9;
      desktop = 12;
      popups = 12;
    };
  };
}
