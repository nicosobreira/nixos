{pkgs, ...}: {
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # GTK apps + portals
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
}
