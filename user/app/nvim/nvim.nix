{ pkgs-stable, ... }:

{
  home.packages = with pkgs-stable; [
    neovim

    nodejs # For nmp
    tree-sitter # Binary
    cargo # For nil LSP
    ripgrep # For telescope
  ];

  home.file.".config/nvim".source = ./.;
  home.file.".config/nvim".recursive = true;
}
