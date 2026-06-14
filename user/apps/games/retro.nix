{
  pkgs,
  withNvidiaOffload,
  ...
}: let
  myRetroarch = pkgs.retroarch.withCores (
    cores:
      with cores; [
        snes9x
        pcsx2
        genesis-plus-gx
        beetle-psx-hw
        beetle-saturn
        melonds
        mgba
      ]
  );
in {
  home.packages = with pkgs; [
    mame-tools

    (withNvidiaOffload parallel-launcher)
    (withNvidiaOffload myRetroarch)
  ];
}
