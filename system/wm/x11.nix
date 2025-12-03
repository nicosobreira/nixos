{ ... }:

{
  imports = [
    ./awesome.nix
  ];

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 50;

    xkb = {
      layout = "br";
      variant = "abnt2";
      model = "pc105";
      options = "eurosign:e,caps:escape";
    };

    displayManager = {
      lightdm.enable = true;
    };
  };

  services.libinput = {
    enable = true;
    touchpad.disableWhileTyping = true;
  };

  # Set dark theme for GTK and QT applications globally
  environment.variables = {
    GTK_THEME = "Adwaita:dark";  # Default GTK dark theme
    QT_QPA_PLATFORMTHEME = "qt5ct";  # For Qt applications
  };
}
