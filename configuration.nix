# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./system/stylix.nix

    # ./system/printing.nix
    ./system/hardware/power.nix
    ./system/hardware/opengl.nix
    ./system/hardware/gpu/${systemSettings.gpuType}.nix
    ./system/security/firewall.nix
    ./system/wm/x11.nix # Also set up awesome as WM
    ./system/app/flatpak.nix
    ./system/games
    # ./system/app/syncthing.nix
  ];

  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 50;

    xkb = {
      layout = "br";
      variant = "abnt2";
    };
  };

  environment.localBinInPath = true;

  services.udisks2.enable = true;
  programs.gnome-disks.enable = true;

  # Home manager
  home-manager = {
    backupFileExtension = "backup";
    useUserPackages = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = systemSettings.hostname;
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  systemd.network.wait-online.enable = false;

  time.timeZone = systemSettings.timeZone;

  i18n.defaultLocale = systemSettings.language;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  # xkb options in tty
  console = {
    useXkbConfig = true;
  };

  # Audio
  services.pulseaudio.enable = false;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.username;
    extraGroups = [
      "video" # Screen light control
      "networkmanager"
      "wheel" # Enable ‘sudo’ for the user.
      "storage"
    ];
  };

  # Fonts
  fonts.fontconfig = {
    antialias = true;
    hinting.enable = true;
  };

  fonts.fontDir.enable = true;

  environment.shells = with pkgs; [bash];
  users.defaultUserShell = pkgs.bash;
  programs.bash.enable = true;

  # Brightness control
  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    git

    # lshw
    wget
    curl
    unzip
    zip
    gnutar
    unrar
    p7zip
  ];

  # Nix config
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      persistent = true;
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

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
