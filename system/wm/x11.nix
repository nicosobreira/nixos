{pkgs, ...}: {
  imports = [
    ./wm/awesome.nix
  ];

  environment.systemPackages = with pkgs; [
    xclip
  ];

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

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
