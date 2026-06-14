{...}: {
  imports = [
    ./wm/awesome.nix
  ];

  services.xserver = {
    enable = true;

    displayManager = {
      lightdm.enable = true;
    };
  };

  # Set dark theme for GTK and QT applications globally
  environment.variables = {
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
}
