{ ... }:

{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  programs.steam.enable = true;
}
