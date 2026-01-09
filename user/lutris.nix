{
  pkgs,
  config,
  ...
}: {
  programs.lutris.enable = true;

  home.packages = with pkgs; [
    antimicrox
  ];

  programs.lutris.runners = {
    pcsx2 = {
      package = pkgs.pcsx2;
      settings = {
        runner.fullscreen = true;
      };
    };

    libretro = {
      package = pkgs.retroarch.withCores (cores:
        with cores; [
          snes9x
          mgba
        ]);
    };
  };
}
