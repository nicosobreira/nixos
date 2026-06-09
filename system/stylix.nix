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
    image = ./../wallpapers/nausicaa/1.png;
    polarity = "dark";

    fonts = {
      sansSerif = {
        name = "Ubuntu";
        package = pkgs.nerd-fonts.ubuntu;
      };
      serif = {
        name = "Ubuntu Serif";
        package = pkgs.nerd-fonts.ubuntu;
      };
      monospace = {
        name = userSettings.monoFont;
        package = userSettings.monoFontPkg;
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
