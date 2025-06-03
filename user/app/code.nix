{ pkgs, ... }:

{
  home.packges = with pkgs; [
    lua

    gnumake
    gcc_multi
  ];
}
