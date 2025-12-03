{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Games
    pcsx2
    mame-tools
    duckstation
    (retroarch.withCores (
      cores: with cores; [
        genesis-plus-gx
        snes9x
        beetle-psx-hw
        desmume
        mgba
        parallel-n64
      ]
    ))
  ];
}
