{
  pkgs,
  userSettings,
  ...
}: {
  imports = [
    ./editor/nvim.nix
    ./editor/vim.nix
    ./terminal/${userSettings.terminal}.nix
    ./shell/tools.nix
    ./git.nix
    ./nil.nix
  ];

  home.packages = with pkgs; [
    # Languages
    clang
    lua

    # Tools
    gnumake
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
