{pkgs, ...}: {
  imports = [
    ./editor/nvim.nix
    ./editor/vim.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    # Languages
    clang
    lua

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

    # Formatters
    stylua
  ];
}
