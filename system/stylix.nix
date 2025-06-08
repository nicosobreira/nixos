{ pkgs, userSettings, ... }:

{
  stylix = {
    enable = true;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # base24Scheme = "${pkgs.base24-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./../wallpapers/background.png;
    polarity = "dark";

    fonts = {
      serif = {
        package = userSettings.fontPkg;
        name = userSettings.font;
      };

      sansSerif = {
        package = userSettings.fontPkg;
        name = userSettings.font;
      };

      monospace = {
        package = userSettings.fontPkg;
        name = userSettings.font;
      };

      emoji = {
        package = userSettings.fontPkg;
        name = userSettings.font;
      };
    };

    fonts.sizes = {
      applications = 8;
      terminal = 8;
      desktop = 8;
      popups = 8;
    };
  };
}
