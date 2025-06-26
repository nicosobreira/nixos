{ pkgs, ... }:

{
  # programs.neovim.enable = true;
  # programs.neovim.extraPackages = with pkgs; [ ];

  home.packages = with pkgs; [
    neovim
    nodejs # For nmp
    tree-sitter # Binary
    ripgrep # For telescope

    # LSP, formatters, etc.
    stylua
    lua52Packages.lua-lsp
    zls
    nil # Nix
  ];

  # home.file.".config/nvim".source = ./.;
  # home.file.".config/nvim".recursive = true;
}
