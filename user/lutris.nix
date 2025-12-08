{ pkgs, ... }:

{
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
  };
}
