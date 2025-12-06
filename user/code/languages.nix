{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lua

    gnumake
    cmake
    gdb

    clang
  ];
}
