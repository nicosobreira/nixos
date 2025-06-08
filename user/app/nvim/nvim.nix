{ pkgs-stable, ... }:

{
  home.packages = with pkgs-stable; [
    neovim

    nodejs # For nmp
    tree-sitter
    cargo # For nil LSP
  ];

  home.file.".config/nvim".source = ./.;
  home.file.".config/nvim".recursive = true;
}
