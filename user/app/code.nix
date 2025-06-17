{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh

    lua

    gnumake
    gcc_multi

    zig
  ];
}
