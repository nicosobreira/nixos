{
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ./wm/sway.nix
  ];
  # Required for Wayland
  security.polkit.enable = true;

  # Login manager (optional but recommended)
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway";
        user = userSettings.username;
      };
    };
  };

  # Required for screen sharing, file pickers, etc.
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };
}
