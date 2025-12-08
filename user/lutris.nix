{ pkgs, ... }:

{
  programs.lutris.enable = true;

  programs.lutris.runners = {
    pcsx2 = {
      package = pkgs.pcsx2;
      settings = {
        runner.fullscreen = true;
      };
    };
  };
}
