{ pkgs-stable, ... }:

{
  home.packages = with pkgs-stable; [
    neovim

    nodejs
    tree-sitter
    cargo  # nil LSP
  ];
  home.file.".config/nvim".source = ./.;
  home.file.".config/nvim".recursive = true;
}
