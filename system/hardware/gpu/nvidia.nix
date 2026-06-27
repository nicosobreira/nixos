# Thanks for this guide!
# https://nixos.wiki/wiki/Nvidia
{
  lib,
  config,
  ...
}: {
  options.hardware.nvidiaEnable = lib.mkEnableOption "NVIDIA GPU support";

  config = lib.mkIf config.hardware.nvidiaEnable {
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-persistenced"
      ];

    # Enable OpenGL
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = [
      "modesetting" # This enables the Intel iGPU
      "nvidia" # And this enables the nvidia GPU
    ];

    hardware.nvidia = {
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        # Verifique com: nix-shell -p pciutils --run "lspci | grep -E 'VGA|3D'"
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };

      # Modesetting is required.
      modesetting.enable = true;

      powerManagement.enable = false;

      # MX110 (Pascal) não suporta
      powerManagement.finegrained = false;

      open = false;

      # Enable the Nvidia settings menu, accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # The version 580 is the correct one for MX110
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    };
  };
}
