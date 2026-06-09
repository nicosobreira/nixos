{...}: {
  imports = [
    ./hardware-configuration.nix
    ./system/stylix.nix
    ./system/user.nix
    ./system/boot.nix

    ./system/network.nix
    ./system/locale.nix
    ./system/audio.nix
    ./system/bluetooth.nix
    ./system/fonts.nix
    ./system/shell.nix
    ./system/packages.nix
    ./system/nix.nix

    ./system/hardware/power.nix
    ./system/hardware/opengl.nix
    ./system/hardware/gpu/nvidia.nix
    ./system/security/firewall.nix
    ./system/display/xserver
    ./system/app/flatpak.nix
    ./system/games
  ];

  hardware.nvidiaEnable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Just don't change it
  system.stateVersion = "25.05"; # Did you read the comment?
}
