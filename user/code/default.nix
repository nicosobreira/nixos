{pkgs, ...}: {
  imports = [
    ./git.nix
    ./web.nix
  ];

  home.packages = with pkgs; [
    # Languages
    clang
    lua
    python311

    # Tools
    ninja
    cmake
    gdb

    # Lsp
    clang-tools
    nil
    lua-language-server
    bash-language-server
    shellcheck
    pyright

    # Formatters
    stylua
    black
  ];
}
