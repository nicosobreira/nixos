{pkgs, ...}: {
  home.packages = with pkgs; [
    clang-tools
    nixd
    lua-language-server
    cmake

    bash-language-server
    shellcheck

    stylua
    alejandra
  ];
}
