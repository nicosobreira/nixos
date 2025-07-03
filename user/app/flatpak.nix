{ ... }:

{
  xdg.portal.enable = true;

  xdg.portal.config = {
    commom = {
      default = [
        "gtk"
      ];
    };
  };

  services.flatpak = {
    enable = true;
  };
}
