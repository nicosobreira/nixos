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
    brightnessctl

    nerd-fonts.caskaydia-cove
  ];

  environment.pathsToLink = ["/share/awesome"];
}
