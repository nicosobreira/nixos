{ pkgs, userSettings, ... }:

{
  stylix = {
    enable = true;
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 10;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # base24Scheme = "${pkgs.base24-schemes}/share/themes/catppuccin-mocha.yaml";
    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
      hash = "sha256-enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
    };
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
  };
}
