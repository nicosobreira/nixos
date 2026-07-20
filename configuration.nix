{...}: {
  imports = [
    ./hardware-configuration.nix

    ./system/utils/nvidia-offload.nix

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
    ./system/hardware/cpu/intel.nix

    ./system/security/firewall.nix

    ./system/display/xserver

    ./system/apps
    ./system/apps/flatpak.nix
    ./system/apps/games

    ./system/docs.nix
  ];

  hardware.nvidiaEnable = true;
  hardware.intelEnable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # My current SSD has a problem, setting the link power to max performace can help
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="scsi_host", KERNEL=="host*", ATTR{link_power_management_policy}="max_performance"
  '';

  # Just don't change it
  system.stateVersion = "25.05"; # Did you read the comment?
}
