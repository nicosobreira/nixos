{ pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [
    gh

    lua

    gnumake
    gcc_multi
    gdb

    zig
  ];

  programs.git = {
    enable = true;
    userName  = "nicosobreira";
    userEmail = userSettings.email;
  };
}
