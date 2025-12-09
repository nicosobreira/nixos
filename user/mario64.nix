{ ... }:

{
  programs.sm64ex = {
    enable = true;
    region = "us";
    baserom = "/home/acerola/Games/retro/roms/n64/Super Mario 64/baserom.us.n64";
    extraCompileFlags = [
      "BETTERCAMERA=1"
      "TEXTURE_FIX=1"
    ];
  };
}
