{ pkgs, ... }:

{
  xdg.portal.enable = true;

  xdg.portal.config = {
    commom = {
      default = [
        "gtk"
      ];
    };
  };

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];

  services.flatpak = {
    enable = true;
  };
}
