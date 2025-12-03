{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lua

    gnumake
    cmake
    gcc_multi
    gdb

    clang-tools
    # llvmPackages.libcxxClang
  ];
}
