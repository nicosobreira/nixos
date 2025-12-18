{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mame-tools
    (retroarch.withCores (
      cores:
        with cores; [
          nxengine
          snes9x
          pcsx2
          # genesis-plus-gx
          # beetle-psx-hw
          # desmume
          # mgba
          # parallel-n64
        ]
    ))
  ];
}
