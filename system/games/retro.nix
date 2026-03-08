{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mame-tools
    parallel-launcher
    (retroarch.withCores (
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
    ))
  ];
}
