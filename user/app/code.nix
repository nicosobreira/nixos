{ pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [
    gh

    lua

    gnumake
    cmake
    gcc_multi
    gdb

    # clang
    clang-tools
    # llvmPackages.libcxxClang

    zig
  ];

  programs.git = {
    enable = true;
    userName = "nicosobreira";
    userEmail = userSettings.email;
  };
}
