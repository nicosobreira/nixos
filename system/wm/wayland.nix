{
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ./wm/sway.nix
  ];
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # GTK apps + portals
  };

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

  # Basic Wayland utilities
  environment.systemPackages = with pkgs; [
    sway
    swaylock
    swayidle
    waybar
    wofi
    foot
    grim
    slurp
    wl-clipboard
    mako
    playerctl
    xdg-utils
  ];

  # Required for screen sharing, file pickers, etc.
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };
}
