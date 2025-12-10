{
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "vivaldi"
    ];

  home.packages = with pkgs; [
    vivaldi
  ];
}
