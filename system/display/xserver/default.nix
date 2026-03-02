{...}: {
  imports = [
    ./wm/awesome.nix
  ];

  services.xserver = {
    enable = true;

    dpi = 80;

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
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
}
