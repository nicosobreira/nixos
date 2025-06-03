{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lua

    gnumake
    gcc_multi
  ];
}
