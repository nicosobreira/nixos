{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gh

    lua
    stylua

    gnumake
    gcc_multi
  ];
}
