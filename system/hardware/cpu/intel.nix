{
  lib,
  config,
  ...
}: {
  options.hardware.intelEnable = lib.mkEnableOption "NVIDIA GPU support";

  config = lib.mkIf config.hardware.nvidiaEnable {
    services.thermald.enable = true;
  };
}
