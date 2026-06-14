{pkgs, ...}: {
  imports = [
    ./../utils/clipboard.nix
  ];

  services.xserver.windowManager.awesome = {
    enable = true;
    noArgb = true;
  };

  environment.systemPackages = with pkgs; [
    flameshot

    wireplumber # `wpctl`
    pwvucontrol # Audio mixer
  ];

  # For `light`
  programs.light.enable = true;

  environment.pathsToLink = ["/share/awesome"];
}
