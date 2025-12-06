{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    tree-sitter # Binary
    ripgrep # For telescope
  ];
}
