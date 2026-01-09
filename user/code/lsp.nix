{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang-tools
    lua-language-server
    cmake

    stylua
    alejandra
  ];
}
