{ pkgs, ... }:

{
  programs.neovim.enable = true;
  # programs.neovim.extraPackages = with pkgs; [ ];

  home.packages = with pkgs; [
    nodejs # For nmp
    tree-sitter # Binary
    ripgrep # For telescope

    # LSP, formatters, etc.
    stylua
    zls
    rocmPackages.llvm.rocm-merged-llvm # Clangd
    nil # Nix
  ];

  home.file.".config/nvim".source = ./.;
  home.file.".config/nvim".recursive = true;
}
