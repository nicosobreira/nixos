{ pkgs, config, ... }:

{
  programs.lutris.enable = true;

  home.packages = with pkgs; [
    antimicrox

    # SM64Plus build dependencies
    git
    pkg-config
    libusb1
    SDL2
    cmake
  ];

  programs.lutris.runners = {
    pcsx2 = {
      package = pkgs.pcsx2;
      settings = {
        runner.fullscreen = true;
      };
    };

    libretro = {
      package = (pkgs.retroarch.withCores (cores: with cores; [
        snes9x
        mgba
      ]));
    };
  };
}
